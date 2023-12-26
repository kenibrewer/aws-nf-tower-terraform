terraform {
  required_version = ">= 0.13.0"
  required_providers {
    nftower = {
      source  = "healx/nftower"
      version = "0.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}
provider "nftower" {
  api_key      = var.nftower_api_key
  api_url      = var.nftower_api_url
  organization = var.nftower_organization
}
provider "random" {
}