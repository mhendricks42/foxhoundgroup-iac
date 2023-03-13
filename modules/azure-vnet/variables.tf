variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to deploy the VNet into"
}

variable "location" {
  type        = string
  description = "The location of the resource group to deploy the VNet into"
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space of the Virtual Network"
}

variable "subnets" {
  type = map(object({
    name                      = string
    address_prefix            = string
    security_group            = string
  }))
  description = "A map of subnet configurations"
}

