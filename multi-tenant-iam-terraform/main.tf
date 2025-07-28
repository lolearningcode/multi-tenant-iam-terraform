provider "aws" {
  region = "us-east-1"
}

# Create IAM Roles
resource "aws_iam_role" "customer_roles" {
  for_each = var.customers

  name = "iam-role-${each.key}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::123456789012:root" # Replace with actual trusted account or service
      },
      Action = "sts:AssumeRole"
    }]
  })
}

# Create IAM Policies
resource "aws_iam_policy" "customer_policies" {
  for_each = var.customers

  name        = "customer-policy-${each.key}"
  description = "Policy for ${each.key} to access ${each.value.bucket_name}"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = each.value.permissions,
      Resource = "arn:aws:s3:::${each.value.bucket_name}/*"
    }]
  })
}

# Attach IAM Policies to IAM Roles
resource "aws_iam_role_policy_attachment" "customer_attachments" {
  for_each = var.customers

  role       = aws_iam_role.customer_roles[each.key].name
  policy_arn = aws_iam_policy.customer_policies[each.key].arn
}