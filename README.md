[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

# Module: Dynamic NSG Administration

## Description

A simple module to administer a large subset of different NSGs across different networks and subnets hosted in Azure by using a master config file (locals.tf).
See [examples](https://github.com/Pwd9000-ML/terraform-azurerm-nsg-administration/tree/master/examples/dynamic_nsg_config_1) for more details.

Example:

```hcl
# Specify where NSGs are located using these variables (tfvars):
nsg_resource_group_name = "pwd9000-NSGs-admin-RG"
nsg_identifiers         = ["my_azure_nsg1", "my_azure_nsg3"] #Selectively apply to only these NSGs in the master config (locals file).

# Specify master NSG config (locals):
# Master config file
locals {

  nsg_config = {

    #Identify NSG 1 (Rename "my_azure_nsg1". Only used as identifier)
    my_azure_nsg1 = {
      nsgName = "pwd9000-subnet1-nsg", #Name of NSG to apply rules to
      nsgRules = [
        {
          nsg_rule_name              = "DummyRule-Deny-Access-from"
          priority                   = "100"
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "192.168.10.0/24"
          destination_address_prefix = "VirtualNetwork"
        },
        {
          nsg_rule_name              = "DummyRule-Deny-Access-to"
          priority                   = "100"
          direction                  = "Outbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "VirtualNetwork"
          destination_address_prefix = "192.168.10.0/24"
        }
      ]
    }

    #Identify NSG 2 (Rename "my_azure_nsg2". Only used as identifier)
    my_azure_nsg2 = {
      nsgName = "pwd9000-subnet2-nsg", #Name of NSG to apply rules to
      nsgRules = [
        {
          nsg_rule_name              = "DummyRule-Deny-Access-from"
          priority                   = "100"
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "192.168.20.0/24"
          destination_address_prefix = "VirtualNetwork"
        },
        {
          nsg_rule_name              = "DummyRule-Deny-Access-to"
          priority                   = "100"
          direction                  = "Outbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "VirtualNetwork"
          destination_address_prefix = "192.168.20.0/24"
        }
      ]
    }

    #Identify NSG 3 (Rename "my_azure_nsg3". Only used as identifier)
    my_azure_nsg3 = {
      nsgName = "pwd9000-subnet3-nsg", #Name of NSG to apply rules to
      nsgRules = [
        {
          nsg_rule_name              = "DummyRule-Deny-Access-from"
          priority                   = "100"
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "192.168.30.0/24"
          destination_address_prefix = "VirtualNetwork"
        },
        {
          nsg_rule_name              = "DummyRule-Deny-Access-to"
          priority                   = "100"
          direction                  = "Outbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "VirtualNetwork"
          destination_address_prefix = "192.168.30.0/24"
        }
      ]
    }
  }

}

# Applying configuration to selected NSGs
module "nsg_rules_administration" {
  for_each                = toset(var.nsg_identifiers)
  source                  = "github.com/Pwd9000-ML/terraform-azurerm-nsg-administration"
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = lookup(local.nsg_config[each.value], "nsgName", null)
  nsg_rules               = lookup(local.nsg_config[each.value], "nsgRules", null)
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.32.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_rule.network_nsg_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Specifies the Network Security Group(NSG) name | `string` | n/a | yes |
| <a name="input_nsg_resource_group_name"></a> [nsg\_resource\_group\_name](#input\_nsg\_resource\_group\_name) | Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered | `string` | n/a | yes |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | Specifies a collection of Network Security Group(NSG) rules | `string` | `""` | no |
