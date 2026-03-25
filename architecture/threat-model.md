# Threat Model

This document outlines key assets, likely threats, and example mitigations for the cloud security platform.

## Key Assets

- IAM identities
- Terraform state and infrastructure definitions
- CloudTrail and security logs
- Lambda remediation workflows
- Kubernetes workloads
- CI/CD pipelines

## Example Threats

### Spoofing
Compromised IAM credentials used to impersonate legitimate users.

### Tampering
Unauthorized modification of infrastructure code or cloud resource policies.

### Repudiation
Insufficient logging prevents attribution of sensitive actions.

### Information Disclosure
Misconfigured storage, secrets exposure, or weak access controls reveal sensitive data.

### Denial of Service
Critical workloads or delivery pipelines are disrupted by malicious or accidental actions.

### Elevation of Privilege
Excessive IAM permissions allow broader access than intended.

## Mitigation Themes

- least-privilege IAM
- centralized logging
- preventive policy controls
- automated detection and response
- secure-by-default infrastructure provisioning
