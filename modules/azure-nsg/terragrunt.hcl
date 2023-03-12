# example hcl
terraform {
  source = "git::https://github.com/example/terraform-azure-nsg.git//"
}

inputs = {
  name               = "example-nsg"
  location           = "eastus"
  resource_group_name = "example-rg"
  security_rules = [
    {
      name                        = "rule1"
      priority                    = 100
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "80"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    },
    {
      name                        = "rule2"
      priority                    = 200
      direction                   = "Outbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "443"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    },
  ]
}

