locals {
  common_tags = merge(
    {
      Module = "logging-monitoring"
    },
    var.tags
  )
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

  tags = merge(local.common_tags, {
    Name = "${var.name}-cloudtrail"
  })
}

resource "aws_s3_bucket" "cloudtrail" {
  bucket = "${var.name}-cloudtrail-logs-demo-12345"

  tags = merge(local.common_tags, {
    Name = "${var.name}-cloudtrail-logs"
  })
}