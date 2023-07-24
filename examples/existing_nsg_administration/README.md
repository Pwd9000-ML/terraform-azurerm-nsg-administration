# Terraform Example 1 - Existing NSG administration

## Description

This example can be used to create `NSG rules`, selectively targeting already `existing NSGs` by using identifiers to lookup specific NSGs and applying the NSG rules as layed out in the locals config.  

NSG identifiers are specified in the `nsg_identifiers` input variable and then configured on the `nsg` locals config.  
Using this method of specifying NSG identifiers allows for the NSG rules to be applied to multiple NSGs at once and gives mor control over which NSGs can be administered through this module and which don't.  

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

Configure NSGs selectively using variables:

```hcl
nsg_resource_group_name = "RGName"
nsg_identifiers         = ["nsg_ID1", "nsg_ID2", "n"] #Selectively apply to only these NSGs in the master config (locals file).
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nsg_rules_administration"></a> [nsg\_rules\_administration](#module\_nsg\_rules\_administration) | Pwd9000-ML/nsg-administration/azurerm | >= 1.1.3 |

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