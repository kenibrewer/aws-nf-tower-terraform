# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "terraform-state-${get_env("TF_VARS_AWS_TERRAFORM_ACCOUNT_ID")}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
    profile        = "AWSAdministratorAccess-${get_env("TF_VARS_AWS_TERRAFORM_ACCOUNT_ID")}"
    kms_key_id     = "arn:aws:kms:us-east-1:${get_env("TF_VARS_AWS_TERRAFORM_ACCOUNT_ID")}:alias/terraform-state-${get_env("TF_VARS_AWS_TERRAFORM_ACCOUNT_ID")}"
  }
}
