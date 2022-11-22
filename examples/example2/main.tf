##################################################
# PROVIDERS                                      #
##################################################
provider "azurerm" {
  features {}
}

##################################################
# MODULES                                        #
##################################################
module "dynamic-subnets" {
  source                  = "github.com/Pwd9000-ML/terraform-azurerm-nsg-administration"
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = var.nsg_name
  nsg_config              = var.nsg_config
}
