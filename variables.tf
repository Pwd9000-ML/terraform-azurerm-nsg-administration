variable "nsg_resource_group_name" {
  type        = string
  description = "Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered"
}

variable "nsg_identifiers" {
  type        = list(string)
  default     = []
  description = "Specifies a list of Network Security Group(NSG) identifiers used in config"
}

variable "nsg_config" {
  description = "Specifies a Network Security Group(NSG) config"
  default     = ""
}