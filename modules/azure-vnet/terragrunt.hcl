# example hcl
# Include the Azure VNet module
include {
  path = "../modules/networking/vnet"
}

# Set input variables for the Azure VNet module
inputs = {
  resource_group_name       = "my-resource-group"
  resource_group_location   = "eastus"
  vnet_name                 = "my-vnet"
  vnet_address_space        = ["10.0.0.0/16"]
  subnets = {
    subnet1 = {
      name                      = "subnet1"
      address_prefix            = "10.0.1.0/24"
      security_group            = "my-subnet1-nsg"
    },
    subnet2 = {
      name                      = "subnet2"
      address_prefix            = "10.0.2.0/24"
      security_group            = "my-subnet2-nsg"
    }
  }
}

