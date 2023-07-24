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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nsg_rules_administration"></a> [nsg\_rules\_administration](#module\_nsg\_rules\_administration) | Pwd9000-ML/nsg-administration/azurerm | >= 1.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nsg_identifiers"></a> [nsg\_identifiers](#input\_nsg\_identifiers) | Specifies NSG identifiers in the nsg locals config | `list(string)` | `[]` | no |
| <a name="input_nsg_resource_group_name"></a> [nsg\_resource\_group\_name](#input\_nsg\_resource\_group\_name) | Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->