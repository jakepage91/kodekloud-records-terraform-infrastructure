output "user_credentials" {
  description = "Map of usernames to their access and secret keys"
  value       = {
    for i in aws_iam_user.new_users[*].name :
    i => {
      access_key = aws_iam_access_key.user_keys[index(aws_iam_user.new_users[*].name, i)].id
      secret_key = aws_iam_access_key.user_keys[index(aws_iam_user.new_users[*].name, i)].secret
    }
  }
  sensitive = true
}

output "user_names" {
  description = "List of created IAM usernames"
  value       = aws_iam_user.new_users[*].name
}

output "attached_policies" {
  description = "Map of usernames to their attached policies"
  value       = {
    for i in aws_iam_user.new_users[*].name :
    i => [
      for policy in aws_iam_user_policy_attachment.user_policy_attachments :
      policy.policy_arn if policy.user == i
    ]
  }
}