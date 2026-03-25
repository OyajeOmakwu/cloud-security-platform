# Incident Response

This project models a lightweight response flow:

1. security finding is generated
2. EventBridge routes the event
3. Lambda executes automated response logic
4. responders investigate context and determine next actions
