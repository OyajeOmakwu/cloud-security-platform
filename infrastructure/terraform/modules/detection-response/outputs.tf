output "sns_topic_arn" {
  value = aws_sns_topic.security_alerts.arn
}

output "event_rule_name" {
  value = aws_cloudwatch_event_rule.guardduty_high.name
}

output "lambda_function_name" {
  value = aws_lambda_function.remediation.function_name
}
