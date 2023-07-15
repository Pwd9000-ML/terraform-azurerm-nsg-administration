terraform {
  backend "azurerm" {}
  #backend "local" { path = "terraform-test1.tfstate" }
}

provider "azurerm" {
  features {}
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "dynamic-nsg-test" {
  for_each                = toset(var.nsg_identifiers)
  source                  = "../.."
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules               = lookup(local.nsg_config[each.value], "nsgRules", null)
}