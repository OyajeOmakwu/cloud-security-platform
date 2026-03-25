# Kyverno Policies

This folder contains Kyverno policies used to enforce preventive security controls in Kubernetes environments.

## Focus Areas

- disallow privileged containers
- require resource limits
- restrict risky deployment patterns
- support secure-by-default workload configuration

## Expected Content

- policy definitions
- examples of allowed and denied workloads
- notes explaining why each policy exists

## Why It Matters

Kyverno makes it possible to encode Kubernetes security controls directly into admission policy. This section demonstrates how platform security can prevent unsafe deployments before they reach runtime.
