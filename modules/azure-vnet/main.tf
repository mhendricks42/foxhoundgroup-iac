# Define the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  # Define subnets
  dynamic "subnet" {
    for_each = var.subnets
    content {
      name                      = subnet.value.name
      address_prefix            = subnet.value.address_prefix
      security_group            = subnet.value.security_group
    }
  }
}
