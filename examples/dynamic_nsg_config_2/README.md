# Terraform Example 2 - Dynamic NSG config and administration

## Description

The following example files can be used to demo the module called nsg-administration.  
This example can be used to populate existing NSGs hosted in Azure selectively by using a master config file, `locals.tf`, and identifiers `common.auto.tfvars`.  

The values used from `locals.tf` in this example assumes existing NSGs and acts as a master config file.  
The example contains:  

- Main terraform file: `main.tf`.
- Variables file: `variables.tf`.
- Common variables defining the existing resources and NSG identifiers: `common.auto.tfvars`.
- NSG configuration master file used for nsg configs: `locals.tf`.

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

## Root module Input variables
  
- `nsg_resource_group_name` - (Required) Specifies the Resource Group that contains Network Security Groups(NSGs) to be configured/administered.
- `nsg_identifiers` - (Required) Specifies NSG identifiers in the nsg (locals.tf) config.

## Locals file schema

```hcl
locals {

  nsg_config = {

    nsg_ID1 = {
      nsgName = "Nsg-Name1"
      nsgRules = [
        {
            rule1
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
