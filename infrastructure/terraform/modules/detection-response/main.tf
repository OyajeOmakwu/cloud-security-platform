locals {
  common_tags = merge(
    {
      Module = "detection-response"
    },
    var.tags
  )
}

# SNS Topic for alerts
resource "aws_sns_topic" "security_alerts" {
  name = "${var.name}-security-alerts"

  tags = local.common_tags
}

# EventBridge rule for GuardDuty findings
resource "aws_cloudwatch_event_rule" "guardduty_high" {
  name        = "${var.name}-guardduty-high"
  description = "Capture high severity GuardDuty findings"

  event_pattern = jsonencode({
    source = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = [{
        numeric = [">=", 7]
      }]
    }
  })
}

# Lambda function
resource "aws_lambda_function" "remediation" {
  function_name = "${var.name}-remediation"

  handler = "lambda_function.lambda_handler"
  runtime = "python3.11"

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  role = aws_iam_role.lambda_role.arn

  tags = local.common_tags
}

# IAM role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "${var.name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# EventBridge → SNS
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_high.name
  target_id = "sns"
  arn       = aws_sns_topic.security_alerts.arn
}

# EventBridge → Lambda
resource "aws_cloudwatch_event_target" "lambda" {
  rule      = aws_cloudwatch_event_rule.guardduty_high.name
  target_id = "lambda"
  arn       = aws_lambda_function.remediation.arn
}

# Allow EventBridge to invoke Lambda
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remediation.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.guardduty_high.arn
}
