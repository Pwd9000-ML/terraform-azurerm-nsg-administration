terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-test1.tfstate" }
}

provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
#Dynamic NSGs
module "nsg_rules_administration" {
  for_each                = toset(var.nsg_identifiers)
  source                  = "Pwd9000-ML/nsg-administration/azurerm"
  version                 = ">= 1.1.0"
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules               = lookup(local.nsg_config[each.value], "nsgRules", null)
}