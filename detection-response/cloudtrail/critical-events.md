# Critical CloudTrail Events

This document lists high-value CloudTrail events that should be monitored for detection and investigation.

---

## Authentication Events

### ConsoleLogin
Tracks AWS Management Console logins.

**Why it matters**
- detects interactive access to the account
- useful for identifying unusual login activity
- important for root or privileged user monitoring

---

## IAM and Identity Changes

### CreateUser
A new IAM user was created.

**Why it matters**
- may indicate unauthorized persistence or privilege expansion

### CreateAccessKey
A new access key was created.

**Why it matters**
- introduces a long-lived credential that may be abused

### AttachRolePolicy
A policy was attached to a role.

**Why it matters**
- may expand permissions unexpectedly

### PutUserPolicy
An inline policy was added or changed.

**Why it matters**
- may introduce privilege escalation

### UpdateAssumeRolePolicy
A role trust policy was changed.

**Why it matters**
- may allow unexpected principals to assume a role

---

## Logging and Visibility Changes

### StopLogging
CloudTrail logging was stopped.

**Why it matters**
- may indicate an attempt to reduce visibility

### DeleteTrail
A CloudTrail trail was deleted.

**Why it matters**
- high-risk action that affects accountability and investigation

### DeleteFlowLogs
VPC Flow Logs were removed.

**Why it matters**
- may reduce visibility into network activity

---

## Storage and Exposure Changes

### PutBucketPolicy
An S3 bucket policy was changed.

**Why it matters**
- may introduce public access or unauthorized access paths

### PutBucketAcl
An S3 ACL was changed.

**Why it matters**
- may expose objects or buckets unintentionally

### PutBucketPublicAccessBlock
Public access settings were changed.

**Why it matters**
- critical for monitoring exposure risk

---

## Network and Security Changes

### AuthorizeSecurityGroupIngress
A new inbound security group rule was added.

**Why it matters**
- may expose services to the internet unexpectedly

### RevokeSecurityGroupIngress
An inbound rule was removed.

**Why it matters**
- useful during investigation or change review

### CreateInternetGateway
An internet gateway was created.

**Why it matters**
- can indicate changing exposure posture

### AttachInternetGateway
An internet gateway was attached to a VPC.

**Why it matters**
- may increase public accessibility

---

## KMS and Encryption Changes

### DisableKey
A KMS key was disabled.

**Why it matters**
- may disrupt access to encrypted resources or indicate malicious action

### ScheduleKeyDeletion
A KMS key was scheduled for deletion.

**Why it matters**
- high-impact action that affects long-term data access

---

## Monitoring Strategy

These events should be:
- logged reliably
- reviewed in context
- correlated with GuardDuty and Security Hub findings
- prioritized when performed by privileged identities or from suspicious sources
