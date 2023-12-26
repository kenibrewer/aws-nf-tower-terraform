#Random ID for unique naming
resource "random_integer" "random_suffix" {
  min = 10000
  max = 99999
}

data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    Name        = "nftower-modules/credentials"
    Environment = var.environment_name
    Owner       = "nftower"
    Terraform   = "true"
  }

  # Create an IAM user for Nextflow Tower
  generated_aws_user_name           = "${var.aws_user_name}-${random_integer.random_suffix.result}"
  generated_aws_user_policy_name    = "nftower_policy-${random_integer.random_suffix.result}"
  generated_aws_bucket_policy_name  = "nftower_bucket_policy-${random_integer.random_suffix.result}"
  generated_nftower_credential_name = "${var.nftower_credential_name}-${random_integer.random_suffix.result}"
  generated_bucket_name             = "${data.aws_caller_identity.current.account_id}-${var.aws_bucket_name}-${random_integer.random_suffix.result}"
}
