# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically variables from the parent folders
  aws_account_vars = read_terragrunt_config(find_in_parent_folders("aws_account.hcl"))
  aws_region_vars  = read_terragrunt_config(find_in_parent_folders("aws_region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  nftower_vars     = read_terragrunt_config(find_in_parent_folders("nftower.hcl"))

  # Set the AWS Account ID for the management account
  management_account_id = 934492087370
  aws_account_id        = local.aws_account_vars.locals.aws_account_id
  aws_profile           = local.aws_account_vars.locals.aws_profile
  aws_region            = local.aws_region_vars.locals.aws_region
  environment           = local.environment_vars.locals.environment
  nftower_api_url       = local.nftower_vars.locals.nftower_api_url
  nftower_organization  = local.nftower_vars.locals.nftower_organization

}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "terraform-state-${local.management_account_id}"
    key            = "aws-nf-tower-terraform/${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
    profile        = "AWSAdministratorAccess-${local.management_account_id}"
    kms_key_id     = "arn:aws:kms:us-east-1:${local.management_account_id}:alias/terraform-state-${local.management_account_id}"
  }
}

# Merge the different locals into a single map for the inputs
inputs = merge(
  local.aws_account_vars.locals,
  local.aws_region_vars.locals,
  local.environment_vars.locals,
  local.nftower_vars.locals,
)