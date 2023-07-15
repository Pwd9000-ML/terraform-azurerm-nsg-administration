##################################################
# VARIABLES                                      #
##################################################
variable "nsg_resource_group_name" {
  type        = string
  description = "Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered"
  nullable    = false
}


variable "nsg_identifiers" {
  type        = list(string)
  default     = []
  description = "Specifies NSG identifiers in the nsg locals config"
}