# Detection Strategy

The detection strategy focuses on high-value signals from IAM activity, configuration changes, public exposure, and suspicious behavior in cloud environments.

## Detection Priorities

- suspicious IAM activity
- configuration drift and control-plane changes
- public exposure and risky policy changes
- threat signals from AWS-native security services

## Primary Sources

- GuardDuty
- Security Hub
- CloudTrail
- VPC Flow Logs

## Design Principle

Detection should be focused on high-value signals that can drive meaningful investigation and response.
