locals {

  nsg_config = {

    #Identify NSG 1 (Rename "my_azure_nsg1". Only used as indetifier)
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

    #Identify NSG 2 (Rename "my_azure_nsg2". Only used as indetifier)
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

    #Identify NSG 3 (Rename "my_azure_nsg3". Only used as indetifier)
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
