nsg_config = {
  #Identify NSG 1
  identifier1 = {
    nsgName = "application-identifier1-nsg",
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

  #Identify NSG 2
  identifier2 = {
    nsgName = "application-identifier2-nsg",
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

  #Identify NSG 3
  identifier3 = {
    nsgName = "application-identifier3-nsg",
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
