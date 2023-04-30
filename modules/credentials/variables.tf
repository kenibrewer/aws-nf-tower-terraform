variable "nftower_user_name" {
  type = string
  description = "The name of the IAM user to create"
  default = "nftower_access"
}

variable "nftower_user_path" {
  type = string
  description = "The path in which to create the IAM user"
  default = "/terraform/nftower/"
}

variable "NFTOWER_API_KEY" {
  type = string
  description = "The API key for Nextflow Tower"
  sensitive = true
}

variable "NFTOWER_ORGANIZATION" {
  type = string
  description = "The name of the Nextflow Tower organization"
  default = "nftower"
}

variable "nftower_api_url" {
  type = string
  description = "The URL of the Nextflow Tower API"
  default = "https://tower.nf/api/v1"
}

variable "aws_region" {
  type = string
  description = "The AWS region in which to create resources"
  default = "us-east-1"
}

variable "aws_profile" {
  type = string
  description = "The AWS profile to use for creating resources"
}

variable "environment_name" {
  type = string
  description = "The name of the environment in which to create resources"
  default = "dev"
}