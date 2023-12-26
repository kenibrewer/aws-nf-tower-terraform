# Random ID for unique naming

locals {
  azs      = ["us-east-1a"]
  vpc_cidr = "10.106.0.0/16"
  name     = "vpc"
  common_tags = {
    Environment = var.environment_name
    Owner       = "nftower"
    Terraform   = "true"
  }
}