terraform {
  source = "${get_parent_terragrunt_dir()}/modules//azure-vm"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../global/resource_groups","../spoke-vnet"]
}

dependency "resource_groups" {
  config_path = "../../global/resource_groups"

  mock_outputs = {
    resource_group_name = "rg-terragrunt-mock-001"
  }
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "output"]
}

dependency "spoke_vnet" {
  config_path = "../spoke-vnet"

  mock_outputs = {
    nsg_id = "/mock/outputs/id/vnet-terragrunt-mock-001"
  }
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "output"]
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment = local.env_vars.locals.environment

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location = local.region_vars.locals.location
}

inputs = {
  resource_group_name   = dependency.resource_groups.outputs.resource_group_name
  location              = local.location
  vnet_name             = dependency.spoke_vnet.outputs.vnet_name
  subnet_name           = dependency.spoke_vnet.outputs.vnet_name
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
  admin_password        = var.vm_password
}

