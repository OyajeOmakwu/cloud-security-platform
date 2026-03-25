locals {
  common_tags = merge(
    {
      Module = "guardrails"
    },
    var.tags
  )
}

resource "aws_ebs_encryption_by_default" "this" {
  enabled = true
}

resource "aws_s3_account_public_access_block" "this" {
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_default_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  revoke_rules_on_delete = true

  ingress = []
  egress  = []

  tags = merge(local.common_tags, {
    Name = "${var.name}-default-sg-locked-down"
  })
}

data "aws_vpc" "default" {
  default = true
}
