# Cloud Security Platform

Secure-by-default cloud security platform demonstrating Terraform guardrails, cloud detection and response, Kubernetes policy enforcement, and CI/CD supply chain security.

## Highlights
- Terraform-based secure infrastructure patterns
- AWS detection and response workflows
- Kubernetes policy enforcement with Kyverno/OPA
- CI/CD security with scanning, SBOM, and signing
- Developer-friendly secure-by-default control

![Architecture](architecture/architecture.png)

## How It Works

1. Infrastructure is provisioned through Terraform modules with embedded security guardrails
2. CI/CD pipelines validate code, IaC, dependencies, and container images
3. Kubernetes admission policies enforce runtime security controls
4. AWS detection and response workflows monitor activity and trigger automated response actions
5. Logs, metrics, and alerts improve incident visibility and readiness

## Objectives

- Build secure-by-default infrastructure
- Automate detection and response
- Enforce preventive security controls
- Improve developer velocity with built-in guardrails

## Core Components

- AWS foundational security controls
- Terraform modules
- GuardDuty, Security Hub, and CloudTrail
- EventBridge + Lambda remediation
- Kyverno / OPA policy enforcement
- GitHub Actions supply chain security pipeline

## Repository Structure

- `architecture/` — threat model and diagrams
- `infrastructure/terraform/` — reusable Terraform modules and environments
- `detection-response/` — security monitoring and automated response
- `policies/` — preventive controls using policy-as-code
- `ci-cd-security/` — supply chain security controls
- `platform-security/` — Kubernetes, Istio, and Vault examples
- `docs/` — security design decisions and developer enablement documentation

## Example Outputs

### CI/CD Security Checks
![CI Checks](docs/screenshots/ci-checks.png)

### Detection Findings
![Findings](docs/screenshots/findings.png)

### Policy Enforcement
![Policy Enforcement](docs/screenshots/policy-enforcement.png)

## Outcomes

This project demonstrates:

- reduced cloud misconfiguration risk through secure defaults
- improved incident readiness through automated detection and response
- repeatable infrastructure deployment through Terraform
- security enablement that helps developers ship safely and quickly
