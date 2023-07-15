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

## Locals.tf NSG config file schema

Useable values and defaults are shown below:

```hcl
locals {

  nsg_config = {

    nsg_ID1 = {
      nsgName = "Nsg-Name1"
      nsgRules = [
        {
              nsg_rule_name                  = "Rule1" #default
              priority                       = "101" #default
              direction                      = "Any" #default
              access                         = "Allow" #default
              protocol                       = "*" #default
              source_port_range              = null #optional
              source_port_source_port_ranges = null #optional
              destination_port_range         = null #optional
              destination_port_ranges        = null #optional
              source_address_prefix          = null #optional
              source_address_prefixes        = null #optional
              destination_address_prefix     = null #optional
              destination_address_prefixes   = null #optional
        },
        {
            rule2
        }
      ]
    }

    nsg_ID2 = {
      nsgName = "Nsg-Name2"
      nsgRules = [
        {
            rule1
        },
        {
            rule2
        }
      ]
    }

}
```
