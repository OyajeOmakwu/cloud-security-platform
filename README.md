# Cloud Security Platform

Secure-by-default cloud security platform demonstrating Terraform guardrails, cloud detection and response, Kubernetes policy enforcement, and CI/CD supply chain security.

![Architecture](architecture/architecture.png)

## Highlights
- Terraform-based secure infrastructure patterns
- AWS detection and response workflows
- Kubernetes policy enforcement with Kyverno/OPA
- CI/CD security with scanning, SBOM, and signing
- Developer-friendly secure-by-default controls

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

## Outcomes

This project demonstrates:

- reduced cloud misconfiguration risk through secure defaults
- improved incident readiness through automated detection and response
- repeatable infrastructure deployment through Terraform
- security enablement that helps developers ship safely and quickly
