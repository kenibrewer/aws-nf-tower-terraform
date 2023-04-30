variable "nftower_workspace_name" {
  type = string
  description = "The name of the Nextflow Tower workspace. Only alphanumeric characters and hyphens, are allowed."
  default = "terraform-demo-workspace"
}

variable "nftower_workspace_full_name" {
  type = string
  description = "The full name of the Nextflow Tower workspace"
  default = "Terraform Demo Workspace"
}

variable "nftower_workspace_description" {
  type = string
  description = "The description of the Nextflow Tower workspace"
  default = "A demo nextflow tower workspace created by Terraform"
}

variable "nftower_workspace_visibility" {
  type = string
  description = "The visibility of the Nextflow Tower workspace"
  default = "PRIVATE"
}

variable "NFTOWER_API_KEY" {
  type = string
  description = "The API key for Nextflow Tower"
  sensitive = true
}

variable "NFTOWER_ORGANIZATION" {
  type = string
  description = "The name of the Nextflow Tower organization"
}

variable "nftower_api_url" {
  type = string
  description = "The URL of the Nextflow Tower API"
  default = "https://api.tower.nf"
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