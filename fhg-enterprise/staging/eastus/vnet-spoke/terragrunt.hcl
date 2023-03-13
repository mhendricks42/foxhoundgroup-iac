terraform {
  source = "${get_parent_terragrunt_dir()}/modules//azure-vnet"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../global/resource_groups", "../nsg-default"]
}

dependency "resource_groups" {
  config_path = "../../global/resource_groups"

  mock_outputs = {
    resource_group_name = "rg-terragrunt-mock-001"
  }
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "output"]
}

dependency "nsg" {
  config_path = "../nsg-default"

  mock_outputs = {
    nsg_id = "/mock/outputs/id/nsg-terragrunt-mock-001"
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
  vnet_name               = "${local.environment}-${local.location}-${basename(get_terragrunt_dir())}"
  resource_group_name     = dependency.resource_groups.outputs.resource_group_name
  location                = local.location
  vnet_address_space      = ["10.0.0.0/16"]
  subnets = {
    subnet1 = {
      name                      = "AzureBastionSubnet"
      address_prefix            = "10.0.1.0/26"
      security_group            = ""
    },
    subnet2 = {
      name                      = "Management"
      address_prefix            = "10.0.2.0/24"
      security_group            = dependency.nsg.outputs.nsg_id
    },
    subnet4 = {
      name                      = "Workloads"
      address_prefix            = "10.0.4.0/24"
      security_group            = dependency.nsg.outputs.nsg_id
    }
  }
}
