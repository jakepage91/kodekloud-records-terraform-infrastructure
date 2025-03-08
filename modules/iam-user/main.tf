resource "aws_iam_user" "new_users" {
  count = length(var.iam_usernames)
  name  = var.iam_usernames[count.index]
  path  = "/"
}

resource "aws_iam_access_key" "user_keys" {
  count = length(var.iam_usernames)
  user  = aws_iam_user.new_users[count.index].name
}

# Attach managed policies to users
resource "aws_iam_user_policy_attachment" "user_policy_attachments" {
  count      = length(var.iam_usernames) * length(var.managed_policy_arns)
  user       = aws_iam_user.new_users[count.index % length(var.iam_usernames)].name
  policy_arn = var.managed_policy_arns[floor(count.index / length(var.iam_usernames))]
}

# Create and attach inline policy if provided
resource "aws_iam_user_policy" "inline_policy" {
  count  = length(var.iam_usernames) * (var.inline_policy_document != null ? 1 : 0)
  name   = "${var.iam_usernames[count.index]}-inline-policy"
  user   = aws_iam_user.new_users[count.index].name
  policy = var.inline_policy_document
}