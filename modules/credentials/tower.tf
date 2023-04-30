# Add the new AWS credential to the workspace:

# Path: modules/credentials/main.tf

resource "nftower_credentials" "nf_tower_aws_access" {
  workspace_id = var.nftower_workspace_id
  name = local.nftower_credential_name
  description = "AWS credentials for Nextflow Tower"
  aws {
    access_key = aws_iam_access_key.nftower_user.id
    secret_key = aws_iam_access_key.nftower_user.secret
  }
}