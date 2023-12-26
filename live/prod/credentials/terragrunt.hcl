# Include the root `terragrunt.hcl` configuration. 
include "root" {
  path = find_in_parent_folders()
}

# Include the common `terragrunt.hcl` configuration specific to this module.
include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/credentials.hcl"
}

# Overrides for the common configuration.

inputs = {
  nftower_api_key = get_env("TF_VARS_NFTOWER_API_KEY")
}