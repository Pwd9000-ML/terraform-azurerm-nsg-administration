###Common###
variable "tags" {
  type = map(string)
  default = {
    Terraform   = "True"
    Description = "NSG administration module."
    Author      = "Marcel Lupo"
    GitHub      = "https://registry.terraform.io/modules/Pwd9000-ML/nsg-administration/azurerm/latest"
  }
  description = "A map of key value pairs that is used to tag resources created."
}

variable "location" {
  type        = string
  default     = "uksouth"
  description = "Azure region to deploy resources to."
}

###Resource Group###
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where resources will be hosted."
  nullable    = false
}

###NSGs to create###
variable "network_security_groups" {
  type        = list(string)
  default     = ["pwd9000-subnet1-nsg", "pwd9000-subnet2-nsg", "pwd9000-subnet3-nsg"]
  description = "List of NSGs to create."
}