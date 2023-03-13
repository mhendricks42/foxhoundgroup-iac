terraform {
  source = "${get_parent_terragrunt_dir()}/modules//azure-vnet"
}

include {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment = local.env_vars.locals.environment

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location = local.region_vars.locals.location
}

inputs = {
  resource_group_name = "fhg-example-vnet"
  location            = local.location
  tags = {
    environment = local.environment
  }
}
