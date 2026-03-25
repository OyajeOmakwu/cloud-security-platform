locals {
  common_tags = merge(
    {
      Module = "logging-monitoring"
    },
    var.tags
  )
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "cloudtrail" {
  bucket = var.cloudtrail_bucket_name

  tags = merge(local.common_tags, {
    Name = "${var.name}-cloudtrail-logs"
  })
}

resource "aws_s3_bucket_versioning" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = aws_s3_bucket.cloudtrail.arn
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.cloudtrail.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

resource "aws_guardduty_detector" "this" {
  enable = true

  tags = merge(local.common_tags, {
    Name = "${var.name}-guardduty"
  })
}

resource "aws_securityhub_account" "this" {}

resource "aws_cloudtrail" "this" {
  name                          = "${var.name}-cloudtrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  depends_on = [
    aws_s3_bucket_policy.cloudtrail,
    aws_s3_bucket_versioning.cloudtrail,
    aws_s3_bucket_server_side_encryption_configuration.cloudtrail,
    aws_s3_bucket_public_access_block.cloudtrail
  ]

  tags = merge(local.common_tags, {
    Name = "${var.name}-cloudtrail"
  })
}
