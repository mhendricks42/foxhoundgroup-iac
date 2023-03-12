variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create the VNet in."
}

variable "resource_group_location" {
  type        = string
  description = "The location to create the resource group and VNet in."
}

variable "vnet_name" {
  type        = string
  description = "The name of the VNet to create."
}

variable "address_space" {
  type        = list(string)
  description = "The address space to use for the VNet."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet to create."
}

variable "subnet_prefix" {
  type        = string
  description = "The address prefix to use for the subnet."
}

