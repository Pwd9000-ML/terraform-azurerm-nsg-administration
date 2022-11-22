#Dynamic NSGs
module "nsg_rules_admin" {
  for_each                = toset(var.nsg_identifiers)
  source                  = "./modules/nsg"
  nsg_resource_group_name = var.nsg_resource_group_name
  nsg_name                = lookup(var.nsg_config[each.value], "nsgName", null)
  nsg_rules               = lookup(var.nsg_config[each.value], "nsgRules", null)
}