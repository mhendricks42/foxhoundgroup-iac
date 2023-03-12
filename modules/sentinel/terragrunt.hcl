terraform {
  source = "git::https://github.com/your-org/azure-sentinel.git"

  # Optional: Specify the version or branch of the module to use
  # version = "v1.0.0"
}

# Input variables for the module
inputs = {
  # Required: Azure Sentinel workspace name
  workspace_name = "my-sentinel-workspace"

  # Required: Azure Sentinel resource group name
  resource_group_name = "my-resource-group"

  # Optional: Azure Sentinel location (default is "westus2")
  location = "eastus"

  # Optional: Azure Sentinel SKU (default is "Free")
  sku = "Standard"

  # Optional: Additional tags to apply to resources created by the module
  tags = {
    environment = "prod"
  }
}

