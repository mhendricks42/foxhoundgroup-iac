terraform {
  source = "${get_parent_terragrunt_dir()}/modules//azure-nsg"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../global/resource_groups"]
}

dependency "resource_groups" {
  config_path = "../../global/resource_groups"

  mock_outputs = {
    resource_group_name = "rg-terragrunt-mock-001"
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
  name               = "${local.environment}-${local.location}-nsg-001"
  location           = local.location
  resource_group_name = dependency.resource_groups.outputs.resource_group_name
  security_rules = [
    {
      name                        = "DenyRemoteManagementInBound"
      priority                    = 100
      direction                   = "Inbound"
      access                      = "Deny"
      protocol                    = "*"
      source_port_range           = "*"
      destination_port_ranges     = ["22","3389","5985","5986"]
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }
  ]
}

