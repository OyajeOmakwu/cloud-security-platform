# Threat Model

## Key assets

- IAM identities
- Terraform state and infrastructure definitions
- CloudTrail and security logs
- Lambda remediation workflows
- Kubernetes workloads
- CI/CD pipelines

## Example threats

### Spoofing
Compromised IAM credentials used to impersonate legitimate users.

### Tampering
Unauthorized modification of infrastructure code or bucket policies.

### Repudiation
Insufficient logging prevents attribution of sensitive actions.

### Information Disclosure
Misconfigured storage or secrets exposure reveals sensitive data.

### Denial of Service
Critical workloads or pipelines are disrupted by malicious activity.

### Elevation of Privilege
Overly broad IAM permissions allow unintended administrative access.
