locals {
  common_tags = merge(
    {
      Module = "iam-baseline"
    },
    var.tags
  )
}

resource "aws_iam_role" "security_audit" {
  name = "${var.name}-security-audit-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_policy" "security_audit" {
  name        = "${var.name}-security-audit-policy"
  description = "Read-only security audit permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "SecurityAuditReadOnly"
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "iam:Get*",
          "iam:List*",
          "s3:Get*",
          "s3:List*",
          "cloudtrail:Get*",
          "cloudtrail:List*",
          "guardduty:Get*",
          "guardduty:List*",
          "securityhub:Get*",
          "securityhub:Describe*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "security_audit" {
  role       = aws_iam_role.security_audit.name
  policy_arn = aws_iam_policy.security_audit.arn
}
