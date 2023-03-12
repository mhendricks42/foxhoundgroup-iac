# Define the resource group to deploy the VNet into
resource "azurerm_resource_group" "vnet" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Define the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name

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
