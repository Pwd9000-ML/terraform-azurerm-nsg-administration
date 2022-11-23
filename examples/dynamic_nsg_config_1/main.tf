##################################################
# PROVIDERS                                      #
##################################################
provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
#Dynamic NSGs
module "nsg_rules_administration" {
  for_each                = toset(var.nsg_identifiers)
  source                  = "github.com/Pwd9000-ML/terraform-azurerm-nsg-administration"
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules               = lookup(local.nsg_config[each.value], "nsgRules", null)
}