# Detection and Response Module

This module implements automated detection and response for cloud security events.

## Flow

GuardDuty → EventBridge → SNS + Lambda

## Features

- captures high severity GuardDuty findings
- sends alerts via SNS
- triggers Lambda for automated response

## Security Goals

- reduce detection-to-response time
- automate repeatable actions
- integrate security into cloud operations

## Why It Matters

Modern cloud security requires automated detection and response pipelines. This module demonstrates how security signals can trigger real-time action.
