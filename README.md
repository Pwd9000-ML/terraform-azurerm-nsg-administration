[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

# Module: Dynamic NSG Administration

## Description

Terraform Registry module for administering **AZURE Network Security Groups (NSGs)**.

See **[Existing NSG Administration](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/tree/master/examples/existing_nsg_administration):**  
For an example on how to administer existing **NSGs** selectively.  

See **[New NSG Administration](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/tree/master/examples/new_nsg_administration):**  
For an example on how to create and administer **NSGs** in a single module.  

This module is published on the **[Public Terraform Registry - nsg-administration](https://registry.terraform.io/modules/Pwd9000-ML/nsg-administration/azurerm/latest)**  

Enjoy!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.101.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.101.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.network_nsg_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Specifies the Network Security Group(NSG) name | `string` | n/a | yes |
| <a name="input_nsg_resource_group_name"></a> [nsg\_resource\_group\_name](#input\_nsg\_resource\_group\_name) | Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered | `string` | n/a | yes |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | Specifies a list of objects to represent Network Security Group(NSG) rules | <pre>list(object({<br>    nsg_rule_name                = optional(string, "default_rule_name")<br>    priority                     = optional(string, "101")<br>    direction                    = optional(string, "Any")<br>    access                       = optional(string, "Allow")<br>    protocol                     = optional(string, "*")<br>    source_port_range            = optional(string, null)<br>    source_port_ranges           = optional(list(string), null)<br>    destination_port_range       = optional(string, null)<br>    destination_port_ranges      = optional(list(string), null)<br>    source_address_prefix        = optional(string, null)<br>    source_address_prefixes      = optional(list(string), null)<br>    destination_address_prefix   = optional(string, null)<br>    destination_address_prefixes = optional(list(string), null)<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->