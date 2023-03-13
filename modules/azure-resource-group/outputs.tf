output "resource_group_id" {
  value = azurerm_resource_group.general.id
}

output resource_group_name {
  value = var.resource_group_name
  depends_on = [azurerm_resource_group.general]
}
