output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network"
}

output "vnet_address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address space of the Virtual Network"
}

output "subnet_ids" {
  value       = [for subnet in azurerm_virtual_network.vnet.subnet : subnet.id]
  description = "A list of the subnet IDs"
}

output "subnet_names" {
  value       = [for subnet in azurerm_virtual_network.vnet.subnet : subnet.name]
  description = "A list of the subnet names"
}

output "subnet_address_prefixes" {
  value       = [for subnet in azurerm_virtual_network.vnet.subnet : subnet.address_prefix]
  description = "A list of the subnet address prefixes"
}

