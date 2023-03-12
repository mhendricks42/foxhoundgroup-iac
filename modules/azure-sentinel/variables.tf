variable "workspace_name" {
  description = "The name of the Azure Sentinel workspace."
}

variable "resource_group_name" {
  description = "The name of the resource group for the Azure Sentinel workspace."
}

variable "location" {
  description = "The location of the Azure Sentinel workspace."
  default     = "eastus"
}

variable "sku" {
  description = "The SKU of the Azure Sentinel workspace."
  default     = "Free"
}

variable "tags" {
  description = "Additional tags to apply to resources created by the module."
  type        = map(string)
  default     = {}
}

