locals {
  common_tags = {
    Name = "nftower-modules/workspaces"
    Environment = var.environment_name
    Owner = "nftower"
    Terraform = "true"
  }

  # Create an IAM user for Nextflow Tower
  nftower_workspace_name = "${var.nftower_workspace_name}-${var.environment_name}"
}
