# Cloud Security Platform

👉 ADD BADGES HERE 👇

![License](https://img.shields.io/badge/license-MIT-green)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4)
![AWS](https://img.shields.io/badge/cloud-AWS-orange)
![Kubernetes](https://img.shields.io/badge/platform-Kubernetes-326CE5)

Secure-by-default cloud security platform demonstrating Terraform guardrails, cloud detection and response, Kubernetes policy enforcement, and CI/CD supply chain security.

## Highlights
- Terraform-based secure infrastructure patterns
- AWS detection and response workflows
- Kubernetes policy enforcement with Kyverno/OPA
- CI/CD security with scanning, SBOM, and signing
- Developer-friendly secure-by-default control

architecture/diagrams/Cloud-Security-Platform Diagram.drawio.png

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

## Design Decisions

- Terraform was used to standardize secure infrastructure patterns and reduce configuration drift
- AWS-native detection services were used to demonstrate practical cloud monitoring and response workflows
- Kubernetes policy enforcement was added to shift runtime controls left into platform defaults
- CI/CD supply chain controls were included to reduce the risk of vulnerable or unsigned artifacts reaching deployment

## Repository Structure

- `architecture/` diagrams, threat models, and architecture notes
- `infrastructure/terraform/` reusable infrastructure definitions
- `detection-response/` monitoring, alerting, and automated response workflows
- `platform-security/` secure-by-default platform controls
- `policies/` policy-as-code definitions
- `ci-cd-security/` supply chain and pipeline security patterns
- `docs/` supporting documentation and screenshots

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

## Why This Project Matters

This project demonstrates how cloud security can be engineered as part of the platform itself through automation, preventative controls, detection and response, and developer enablement rather than ticket-driven security work.
