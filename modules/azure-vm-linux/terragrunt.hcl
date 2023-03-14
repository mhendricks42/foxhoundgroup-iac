# example hcl
terraform {
  source = "git::https://github.com/example/azure-vm-module.git"
}

inputs = {
  resource_group_name   = "my-resource-group"
  location              = "eastus"
  vnet_name             = "my-vnet"
  subnet_name           = "my-subnet"
  public_ip_name        = "my-public-ip"
  nic_name              = "my-nic"
  vm_name               = "my-vm"
  vm_size               = "Standard_D2_v3"
  os_disk_name          = "my-os-disk"
  image_publisher       = "Canonical"
  image_offer           = "UbuntuServer"
  image_sku             = "18.04-LTS"
  image_version         = "latest"
  admin_username        = "my-username"
  admin_password        = "my-password"
}

