output "ebs_encryption_enabled" {
  description = "Whether EBS encryption by default is enabled"
  value       = aws_ebs_encryption_by_default.this.enabled
}

output "s3_public_access_block_enabled" {
  description = "Whether S3 account-level public access block is enabled"
  value = {
    block_public_acls       = aws_s3_account_public_access_block.this.block_public_acls
    ignore_public_acls      = aws_s3_account_public_access_block.this.ignore_public_acls
    block_public_policy     = aws_s3_account_public_access_block.this.block_public_policy
    restrict_public_buckets = aws_s3_account_public_access_block.this.restrict_public_buckets
  }
}
