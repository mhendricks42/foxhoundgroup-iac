variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create."
}

variable "location" {
  description = "The Azure region in which to create the Resource Group."
}

variable "tags" {
  description = "Additional tags to apply to resources created by the module."
  type        = map(string)
  default     = {}
}

