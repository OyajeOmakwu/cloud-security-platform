# Sample GuardDuty Findings

## UnauthorizedAccess:IAMUser/ConsoleLogin

### Meaning
A suspicious or anomalous console login was detected.

### Risk
This may indicate stolen credentials or unauthorized access.

### Response
- verify source IP and login context
- disable or investigate affected credentials
- review related CloudTrail events