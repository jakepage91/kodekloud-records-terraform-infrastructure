variable "iam_usernames" {
  description = "List of IAM usernames to create"
  type        = list(string)
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to all users"
  type        = list(string)
  default     = []
}

variable "inline_policy_document" {
  description = "JSON formatted inline policy document to attach to all users"
  type        = string
  default     = null
}