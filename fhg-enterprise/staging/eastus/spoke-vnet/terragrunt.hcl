terraform {
  source = "${get_parent_terragrunt_dir()}/modules//vnet"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../global/resource_groups", "../nsg"]
}

dependency "resource_groups" {
  config_path = "../../global/resource_groups"

  mock_outputs = {
    vnet_resource_group_name = "rg-terragrunt-mock-001"
  }
  mock_outputs_merge_strategy_with_state = true
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "output"]
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment = local.env_vars.locals.environment

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location = local.region_vars.locals.location
}

inputs = {
  vnet_name               = "${local.environment}-${local.location}-vnet-spoke-001"
  resource_group_name     = dependency.resource_groups.outputs.vnet_resource_group_name
  resource_group_location = local.location
  vnet_address_space      = ["10.0.0.0/16"]
  subnet_prefixes     	  = ["10.0.1.0/26", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  subnet_names            = ["AzureBastionSubnet", "Management", "Tools", "Workloads"]
  subnets = {
    subnet1 = {
      name                      = "AzureBastionSubnet"
      address_prefix            = "10.0.1.0/26"
      security_group            = dependency.nsg.outputs.nsg_name
    }
  }
}
