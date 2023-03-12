variable "name" {
  description = "Name of the NSG"
}

variable "location" {
  description = "Location where the NSG should be created"
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group where the NSG should be created"
}

variable "security_rules" {
  description = "List of security rules to be created for the NSG"
  type = list(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    destination_port_ranges     = list(string)
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}

