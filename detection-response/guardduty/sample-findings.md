# Sample GuardDuty Findings

This document contains example GuardDuty findings and the recommended investigation or response approach for each.

---

## UnauthorizedAccess:IAMUser/ConsoleLogin

### Meaning
A suspicious or anomalous AWS Management Console login was detected for an IAM user.

### Why It Matters
This may indicate:
- compromised credentials
- login from an unusual IP address or geography
- unauthorized access to the AWS account

### Initial Triage Steps
1. Identify the IAM user involved
2. Review source IP address and geolocation
3. Validate whether MFA was used
4. Review related CloudTrail events before and after the login
5. Check for suspicious follow-on actions such as:
   - `CreateUser`
   - `AttachRolePolicy`
   - `PutBucketPolicy`
   - `StopLogging`

### Response Actions
- validate with the user or system owner
- disable or rotate credentials if compromise is suspected
- review permissions associated with the identity
- escalate if privileged actions occurred

---

## Recon:EC2/PortProbeUnprotectedPort

### Meaning
An EC2 instance is being probed from an external source on an exposed port.

### Why It Matters
This may indicate:
- internet-exposed infrastructure
- reconnaissance activity before exploitation
- overly permissive security groups

### Initial Triage Steps
1. Identify the EC2 instance and attached security groups
2. Confirm whether the exposed port is expected
3. Review VPC Flow Logs for repeated connection attempts
4. Check if the instance hosts sensitive services

### Response Actions
- restrict inbound rules where possible
- validate exposure against intended architecture
- add rate limiting or WAF protections if applicable
- investigate whether the instance should remain public

---

## CredentialAccess:IAMUser/AnomalousBehavior

### Meaning
GuardDuty detected IAM activity that deviates from the normal behavior baseline for a user.

### Why It Matters
This may indicate:
- stolen or abused credentials
- automation misuse
- malicious insider activity

### Initial Triage Steps
1. Review actions performed by the IAM identity
2. Compare with known normal behavior
3. Inspect CloudTrail for high-risk operations
4. Determine whether the activity originated from expected infrastructure or geography

### Response Actions
- temporarily restrict access if compromise is likely
- review recently attached policies and roles
- rotate credentials if needed
- document indicators for future detections

---

## Policy:IAMUser/RootCredentialUsage

### Meaning
The root account credentials were used.

### Why It Matters
Root usage should be extremely rare and tightly controlled.

### Initial Triage Steps
1. Confirm whether the action was expected
2. Verify MFA status for the root account
3. Review CloudTrail for all root-account activity during the time window
4. Check for changes to billing, IAM, CloudTrail, or organization settings

### Response Actions
- investigate immediately
- rotate or secure access if needed
- enable or verify MFA
- reduce future operational dependency on root credentials

---

## Persistence:IAMUser/AnomalousBehavior

### Meaning
An IAM user performed persistence-related behavior outside its expected baseline.

### Why It Matters
This may indicate an attacker is attempting to maintain access.

### Initial Triage Steps
1. Review creation of access keys, users, or roles
2. Inspect policy attachments and trust relationships
3. Look for newly created long-lived credentials
4. Confirm whether the actions were authorized

### Response Actions
- revoke unauthorized credentials
- remove suspicious IAM entities
- audit role trust policies
- review blast radius across the account

---

## General Investigation Workflow

For all findings:
1. Confirm the identity, resource, and time window
2. Validate activity using CloudTrail and related logs
3. Determine whether the action was expected or anomalous
4. Assess blast radius and potential impact
5. Contain, remediate, and document findings
