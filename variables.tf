variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "-1"
}

variable "iam_usernames" {
  description = "List of IAM usernames to create"
  type        = list(string)
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}