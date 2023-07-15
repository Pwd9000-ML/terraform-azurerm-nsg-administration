terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-test2.tfstate" }
}

provider "azurerm" {
  features {}
}

###################################################
# PRE-REQS (RG, NSGs) to test against             #
###################################################
### Resource group to deploy the NSGs into
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = toset(var.network_security_groups)
  name                = each.key
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "dynamic-nsg-test" {
  for_each                = toset(var.network_security_groups)
  source                  = "../.."
  nsg_resource_group_name = azurerm_resource_group.rg.name
  nsg_name                = each.key
  nsg_rules               = lookup(local.nsg_config[each.key], "nsgRules", null)
  depends_on              = [azurerm_network_security_group.nsg]
}