output "guardduty_detector_id" {
  value = aws_guardduty_detector.this.id
}

output "cloudtrail_name" {
  value = aws_cloudtrail.this.name
}