variable "nsg_resource_group_name" {
  type        = string
  description = "Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered"
}

variable "nsg_name" {
  type        = string
  description = "Specifies the Network Security Group(NSG) name to be configured/administered"
}

variable "nsg_rules" {
  description = "Collection of Network Security Rules"
  default     = ""
}