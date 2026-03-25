# Secure VPC Module

This module creates a secure VPC foundation for AWS workloads.

## Includes

- VPC with DNS support
- Public and private subnets
- Internet gateway
- Route tables
- Optional NAT gateway
- VPC flow logs to CloudWatch

## Security goals

- Private subnets by default
- Logging enabled by default
- Reduced accidental public exposure

## Why It Matters

A secure network baseline is one of the most important cloud security controls. This module is designed to provide a reusable foundation that other environments and modules can build on safely.
