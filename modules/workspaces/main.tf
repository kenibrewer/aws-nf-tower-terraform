# nftower workspace

# Path: modules/workspaces/main.tf

# Create a workspace

resource "nftower_workspace" "nftower_workspace" {
  name = local.nftower_workspace_name
  full_name = var.nftower_workspace_full_name
  description = var.nftower_workspace_description
  visibility = var.nftower_workspace_visibility
}