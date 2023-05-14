variable "aws_user_name" {
  type        = string
  description = "The name of the IAM user to create"
  default     = "nftower_access"
}

variable "nftower_credential_name" {
  type        = string
  description = "The name of the Nextflow Tower credential"
  default     = "aws-towerforge"
}

variable "aws_user_path" {
  type        = string
  description = "The path in which to create the IAM user"
  default     = "/terraform/nftower/"
}

variable "nftower_api_key" {
  type        = string
  description = "The API key for Nextflow Tower"
  sensitive   = true
}

variable "nftower_organization" {
  type        = string
  description = "The name of the Nextflow Tower organization"
  default     = "nftower"
}

variable "nftower_workspace_id" {
  type        = string
  description = "The ID of the Nextflow Tower workspace"
}

variable "nftower_api_url" {
  type        = string
  description = "The URL of the Nextflow Tower API"
  default     = "https://api.tower.nf"
}

variable "aws_region" {
  type        = string
  description = "The AWS region in which to create resources"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use for creating resources"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment in which to create resources"
  default     = "dev"
}