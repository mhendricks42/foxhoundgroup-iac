# Create an Azure Sentinel workspace
resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = 30
}

# Create a shared access signature (SAS) token for the Azure Sentinel workspace
resource "azurerm_log_analytics_workspace_customer_managed_key" "sentinel_key" {
  workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
}

# Output the workspace ID and SAS token
output "workspace_id" {
  value = azurerm_log_analytics_workspace.sentinel_workspace.id
}

output "sas_token" {
  value = azurerm_log_analytics_workspace_customer_managed_key.sentinel_key.primary_shared_key
}

