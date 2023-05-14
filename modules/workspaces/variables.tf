variable "nftower_workspace_name" {
  type        = string
  description = "The name of the Nextflow Tower workspace. Only alphanumeric characters and hyphens, are allowed."
}

variable "nftower_workspace_full_name" {
  type        = string
  description = "The full name of the Nextflow Tower workspace"
}

variable "nftower_workspace_description" {
  type        = string
  description = "The description of the Nextflow Tower workspace"
  default     = "A demo nextflow tower workspace created by Terraform"
}

variable "nftower_workspace_visibility" {
  type        = string
  description = "The visibility of the Nextflow Tower workspace"
  default     = "PRIVATE"
}

variable "nftower_api_key" {
  type        = string
  description = "The API key for Nextflow Tower"
  sensitive   = true
}

variable "nftower_organization" {
  type        = string
  description = "The name of the Nextflow Tower organization"
}

variable "nftower_api_url" {
  type        = string
  description = "The URL of the Nextflow Tower API"
  default     = "https://api.tower.nf"
}
