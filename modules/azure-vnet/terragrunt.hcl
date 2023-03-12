# example hcl
terraform {
  source = "../vnet/"
}

inputs = {
  resource_group_name    = "my-resource-group"
  resource_group_location = "eastus"
  vnet_name              = "my-vnet"
  address_space          = ["10.0.0.0/16"]
  subnet_name            = "my-subnet"
  subnet_prefix          = "10.0.1.0/24"
}

