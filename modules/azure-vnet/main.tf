resource "azurerm_resource_group" "vnet" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = [var.address_space]

  subnet {
    name           = var.subnet_name
    address_prefix = var.subnet_prefix
  }
}

