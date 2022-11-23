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
  for_each                    = toset(var.nsg_identifiers)
  source                      = "github.com/Pwd9000-ML/terraform-azurerm-nsg-administration"
  network_resource_group_name = var.nsg_resource_group_name
  network_security_group_name = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules                   = lookup(local.nsg_config[each.value], "nsgRules", null)
}