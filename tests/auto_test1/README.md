# Automated Test 1

This terraform module test will create `NSG rules`, selectively targeting already existing NSGs by using an identifier to lookup the NSG name to applying the NSG rules as layed out in the locals config.  

NSG identifiers are specified in the `nsg_identifiers` input variable and then configured on the `nsg` locals config.  
Using this method of specifying NSG identifiers allows for the NSG rules to be applied to multiple NSGs at once and gives mor control over which NSGs can be administered through this module and which don't.  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamic-nsg-test"></a> [dynamic-nsg-test](#module\_dynamic-nsg-test) | ../.. | n/a |

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