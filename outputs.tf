output "adminRoleArn" {
  description = "ARN of the admin role"
  value       = aws_iam_role.iamroleadmin.arn
}
