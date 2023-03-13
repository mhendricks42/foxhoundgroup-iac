terraform {
  source = "${get_parent_terragrunt_dir()}/modules//azure-vm"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../global/resource_groups","../vnet-spoke"]
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
  config_path = "../vnet-spoke"

  mock_outputs = {
    vnet_name = "vnet-terragrunt-mock-001"
    subnet_ids = [
      "/mock/outputs/id/vnet-terragrunt-mock-001",
      "/mock/outputs/id/vnet-terragrunt-mock-002"
      ]
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
  subnet_id             = dependency.spoke_vnet.outputs.subnet_ids[1]
  public_ip_name        = "${basename(get_terragrunt_dir())}-public-ip"
  nic_name              = "${basename(get_terragrunt_dir())}-nic-1"
  vm_name               = "${basename(get_terragrunt_dir())}-1"
  vm_size               = "Standard_D16lds_v5"
  os_disk_name          = "${basename(get_terragrunt_dir())}-os"
  image_publisher       = "Canonical"
  image_offer           = "WindowsServer"
  image_sku             = "2019-Datacenter"
  image_version         = "latest"
  admin_username        = "my-username"
}

