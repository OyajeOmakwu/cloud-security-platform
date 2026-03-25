# Cloud Security Platform

A portfolio project demonstrating secure-by-default cloud architecture, cloud detection and response, policy-as-code, and developer-friendly security controls using AWS, Terraform, Kubernetes, and CI/CD security tooling.

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