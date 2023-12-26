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
