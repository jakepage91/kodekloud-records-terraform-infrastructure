terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket  = "kodekloud-record-store-infrastructure"
    key     = "global/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}

# IAM User Module
module "iam_users" {
  source = "./modules/iam-user"
  
  iam_usernames = var.iam_usernames
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/IAMUserChangePassword"
  ]
  
  inline_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:List*",
          "s3:Get*",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::dev-bucket",
          "arn:aws:s3:::dev-bucket/*"
        ]
      }
    ]
  })
}

