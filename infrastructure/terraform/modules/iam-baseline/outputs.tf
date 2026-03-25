output "security_audit_role_name" {
  value = aws_iam_role.security_audit.name
}

output "security_audit_policy_arn" {
  value = aws_iam_policy.security_audit.arn
}