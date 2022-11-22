# Network Security Rules
resource "azurerm_network_security_rule" "network_nsg_rules" {
  count                        = length(var.nsg_rules)
  name                         = lookup(var.nsg_rules[count.index], "nsg_rule_name", "default_rule_name")
  priority                     = lookup(var.nsg_rules[count.index], "priority", "101")
  direction                    = lookup(var.nsg_rules[count.index], "direction", "Any")
  access                       = lookup(var.nsg_rules[count.index], "access", "Allow")
  protocol                     = lookup(var.nsg_rules[count.index], "protocol", "*")
  source_port_range            = lookup(var.nsg_rules[count.index], "source_port_range", null)
  source_port_ranges           = lookup(var.nsg_rules[count.index], "source_port_ranges", null)
  destination_port_range       = lookup(var.nsg_rules[count.index], "destination_port_range", null)
  destination_port_ranges      = lookup(var.nsg_rules[count.index], "destination_port_ranges", null)
  source_address_prefix        = lookup(var.nsg_rules[count.index], "source_address_prefix", null)
  source_address_prefixes      = lookup(var.nsg_rules[count.index], "source_address_prefixes", null)
  destination_address_prefix   = lookup(var.nsg_rules[count.index], "destination_address_prefix", null)
  destination_address_prefixes = lookup(var.nsg_rules[count.index], "destination_address_prefixes", null)

  resource_group_name         = var.nsg_resource_group_name
  network_security_group_name = var.nsg_name
}