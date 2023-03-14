variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create."
}

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "subnet_id" {
  type        = string
  description = "Id of the subnet."
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public IP address."
}

variable "nic_name" {
  type        = string
  description = "Name of the network interface."
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "Size of the virtual machine."
}

variable "os_disk_name" {
  type        = string
  description = "Name of the OS disk."
}

variable "image_publisher" {
  type        = string
  default     = "Canonical"
  description = "Publisher of the image used to create the virtual machine."
}

variable "image_offer" {
  type        = string
  default     = "UbuntuServer"
  description = "Offer of the image used to create the virtual machine."
}

variable "image_sku" {
  type        = string
  default     = "18.04-LTS"
  description = "SKU of the image used to create the virtual machine."
}

variable "image_version" {
  type        = string
  default     = "latest"
  description = "Version of the image used to create the virtual machine."
}

variable "admin_username" {
  type        = string
  description = "Username for the virtual machine administrator account."
}

variable "admin_password" {
  type        = string
  description = "Password for the virtual machine administrator account."
}

