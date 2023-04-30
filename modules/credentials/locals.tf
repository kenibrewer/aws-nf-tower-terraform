#Random ID for unique naming
resource "random_integer" "random_suffix" {
  min = 10000
  max = 99999
}

locals {
  common_tags = {
    Name = "nftower-modules/credentials"
    Environment = var.environment_name
    Owner = "nftower"
    Terraform = "true"
  }

  # Create an IAM user for Nextflow Tower
  nftower_user_name = "${var.nftower_user_name}-${random_integer.random_suffix.result}"
  nftower_user_policy_name = "nftower_policy-${random_integer.random_suffix.result}"
}
