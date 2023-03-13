output "resource_group_id" {
  value = azurerm_resource_group.general.id
}

output "resource_group_name" {
  value = azurerm_resource_group.general.name
  depends_on = [azurerm_resource_group.general]
}
