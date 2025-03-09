output "user_credentials" {
  description = "Map of usernames to their access and secret keys"
  value       = {
    for k, v in aws_iam_user.new_users : k => {
      access_key = aws_iam_access_key.user_keys[k].id
      secret_key = aws_iam_access_key.user_keys[k].secret
    }
  }
  sensitive = true
}

output "user_names" {
  description = "List of created IAM usernames"
  value       = [for user in aws_iam_user.new_users : user.name]
}

output "attached_policies" {
  description = "Map of usernames to their attached policies"
  value       = {
    for k, v in aws_iam_user.new_users : k => [
      for policy in aws_iam_user_policy_attachment.user_policy_attachments : 
      policy.policy_arn if policy.user == v.name
    ]
  }
}