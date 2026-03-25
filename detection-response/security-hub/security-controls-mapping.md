# Security Controls Mapping

This document maps common AWS Security Hub control themes to practical engineering actions.

---

## S3 Public Access Disabled

### Objective
Prevent accidental public exposure of storage buckets and objects.

### Why It Matters
Public buckets are one of the most common and high-impact cloud misconfigurations.

### Engineering Actions
- enable S3 Block Public Access at account and bucket level
- review bucket policies for wildcard principals
- restrict public ACL usage
- validate exceptions through documented review

---

## CloudTrail Enabled

### Objective
Ensure control-plane activity is logged for investigation and accountability.

### Why It Matters
Without CloudTrail, teams lose the ability to reconstruct sensitive administrative activity.

### Engineering Actions
- enable multi-region CloudTrail
- store logs in a protected S3 bucket
- restrict log bucket access
- monitor for trail disruption events such as:
  - `StopLogging`
  - `DeleteTrail`

---

## Root MFA Enabled

### Objective
Protect the highest-privilege account from simple account takeover.

### Why It Matters
Compromise of the root account can have severe and account-wide consequences.

### Engineering Actions
- enable MFA on the root account
- avoid operational use of root credentials
- review root activity regularly
- monitor root login events in CloudTrail

---

## EBS Encryption Enabled

### Objective
Reduce risk of unauthorized data access from exposed or mishandled storage.

### Why It Matters
Encryption at rest is a baseline cloud security control.

### Engineering Actions
- require encryption by default for block storage
- use customer-managed KMS keys where needed
- validate encryption settings in Terraform modules
- prevent drift through guardrails and policy checks

---

## IAM Least Privilege

### Objective
Limit permissions to only what is required.

### Why It Matters
Overly broad IAM permissions increase blast radius during compromise.

### Engineering Actions
- create scoped roles instead of broad shared users
- review unused permissions
- avoid wildcard actions where possible
- separate audit, operational, and administrative roles

---

## Logging Coverage

### Objective
Ensure relevant activity is visible to defenders.

### Why It Matters
Detection and investigation depend on complete and trustworthy telemetry.

### Engineering Actions
- enable CloudTrail
- enable GuardDuty
- enable Security Hub
- enable VPC Flow Logs where helpful
- retain logs long enough to support incident review

---

## Public Exposure Reduction

### Objective
Reduce unintended public access to cloud services.

### Why It Matters
Internet exposure increases attack surface and raises exploitation risk.

### Engineering Actions
- default workloads to private subnets
- restrict security group ingress
- review load balancer exposure intentionally
- validate whether public endpoints are required

---

## Design Principle

Security controls are most effective when they are:
- automated
- reusable
- visible in infrastructure code
- enforced before risky changes reach production
