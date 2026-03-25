output "vpc_id" {
  value = module.secure_vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.secure_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.secure_vpc.private_subnet_ids
}

output "guardduty_detector_id" {
  value = module.logging_monitoring.guardduty_detector_id
}

output "cloudtrail_name" {
  value = module.logging_monitoring.cloudtrail_name
}

output "cloudtrail_bucket_name" {
  value = module.logging_monitoring.cloudtrail_bucket_name
}

output "security_audit_role_name" {
  value = module.iam_baseline.security_audit_role_name
}

output "ebs_encryption_enabled" {
  value = module.guardrails.ebs_encryption_enabled
}
