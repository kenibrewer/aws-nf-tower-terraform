terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
    nftower = {
      source  = "healx/nftower"
      version = "0.7.2"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
provider "nftower" {
  api_key      = var.nftower_api_key
  api_url      = var.nftower_api_url
  organization = var.nftower_organization
}
provider "random" {
}