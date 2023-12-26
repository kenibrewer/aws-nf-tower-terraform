# Include the root `terragrunt.hcl` configuration.
include "root" {
  path = find_in_parent_folders()
}

# Include the common `terragrunt.hcl` configuration specific to this module.
include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/vpc.hcl"
}
