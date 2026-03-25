# Guardrails Module

This Terraform module enables preventive security guardrails at the AWS account and platform level.

## Includes

- EBS encryption by default
- S3 account-level public access block
- lockdown of the default security group in the default VPC

## Security Goals

- reduce insecure defaults at the account level
- prevent accidental public exposure of S3 resources
- ensure block storage is encrypted by default
- minimize risk from permissive default networking behavior

## Why It Matters

Preventive controls are strongest when they are enforced automatically and applied broadly. This module represents the guardrail layer of the cloud security platform.
