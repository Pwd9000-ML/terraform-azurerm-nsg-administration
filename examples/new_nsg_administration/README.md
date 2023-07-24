# Terraform Example 2 - New NSG administration

## Description

This example will create a `Resource Group` and `NSGs` based on the `network_security_groups` input variable.  
Each NSG is then configured with a set of `NSG rules`, using each NSG name as a lookup and applying the NSG rules as layed out in the locals config.  
This module can be used to create and administer NSGs in a single module.

The values used from `locals.tf` in this example assumes existing NSGs and acts as a master config file.  

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```hcl
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```hcl
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```

## Locals.tf NSG config file schema

```hcl
locals {

  nsg_config = {

    nsgName = {
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

    nsgName = {
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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic-nsg-test"></a> [dynamic-nsg-test](#module\_dynamic-nsg-test) | Pwd9000-ML/nsg-administration/azurerm | >= 1.1.3 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure region to deploy resources to. | `string` | `"uksouth"` | no |
| <a name="input_network_security_groups"></a> [network\_security\_groups](#input\_network\_security\_groups) | List of NSGs to create. | `list(string)` | <pre>[<br>  "pwd9000-subnet1-nsg",<br>  "pwd9000-subnet2-nsg",<br>  "pwd9000-subnet3-nsg"<br>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where resources will be hosted. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pairs that is used to tag resources created. | `map(string)` | <pre>{<br>  "Author": "Marcel Lupo",<br>  "Description": "NSG administration module.",<br>  "GitHub": "https://registry.terraform.io/modules/Pwd9000-ML/nsg-administration/azurerm/latest",<br>  "Terraform": "True"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->