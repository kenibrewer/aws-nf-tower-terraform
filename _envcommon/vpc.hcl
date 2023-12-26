# ---------------------------------------------------------------------------------------------------------------------
# COMMON TERRAGRUNT CONFIGURATION
# This is the common component configuration for workspace. 
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${local.base_source_url}"
}

# ---------------------------------------------------------------------------------------------------------------------
# Locals are named constants that are reusable within the configuration.
# ---------------------------------------------------------------------------------------------------------------------
locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  aws_account_vars = read_terragrunt_config(find_in_parent_folders("aws_account.hcl"))
  aws_region_vars  = read_terragrunt_config(find_in_parent_folders("aws_region.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment

  # This pattern can potentially used to pull specific versions from a separate modules repo
  # base_source_url = "git::git@github.com:kenibrewer/aws-nf-tower-terraform.git//modules/workspaces?ref=v0.1.0"
  base_source_url = "${get_path_to_repo_root()}//modules/vpc"

  common_tags = {
    Environment = local.env
    Owner       = "aws-nf-tower-terraform/live/${local.env}/vpc"
    Terraform   = "true"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module. This defines the parameters that are common across all
# environments.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
}