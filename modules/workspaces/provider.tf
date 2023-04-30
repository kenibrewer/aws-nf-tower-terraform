terraform {
  required_version = ">= 0.13.0"
  required_providers {
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
provider "nftower" {
  api_key = var.NFTOWER_API_KEY
  api_url = var.nftower_api_url
  organization = var.NFTOWER_ORGANIZATION
}
provider "random" {
}