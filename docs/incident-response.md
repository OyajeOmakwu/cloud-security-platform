# Incident Response

This project models a lightweight response flow:

## Response Flow

1. Security finding is generated
2. EventBridge routes the event
3. Lambda executes automated response logic
4. responders investigate, validate context, and determine next steps

## Design Goals

- improve response speed
- automate repeatable low-risk actions
- preserve human judgment for higher-risk decisions
