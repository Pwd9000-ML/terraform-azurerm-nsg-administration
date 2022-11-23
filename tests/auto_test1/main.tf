
terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "dynamic-nsg-test" {
  for_each                    = toset(var.nsg_identifiers)
  source                      = "../.."
  network_resource_group_name = var.nsg_resource_group_name
  network_security_group_name = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules                   = lookup(local.nsg_config[each.value], "nsgRules", null)
}