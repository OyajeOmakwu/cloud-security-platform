# Logging and Monitoring Module

This Terraform module enables foundational AWS monitoring and detection services with a safer CloudTrail log storage configuration.

## Includes

- GuardDuty
- Security Hub
- multi-region CloudTrail
- dedicated S3 bucket for CloudTrail logs
- bucket versioning
- server-side encryption
- public access block
- bucket policy allowing CloudTrail delivery

## Security Goals

- improve cloud visibility
- support threat detection and response readiness
- ensure CloudTrail logs are stored in a protected bucket
- reduce risk of accidental public exposure
- provide a reusable telemetry baseline

## Why It Matters

Detection engineering depends on reliable telemetry and secure log storage. This module establishes the core AWS services needed to observe, investigate, and respond to suspicious activity in a safer and more production-minded way.
