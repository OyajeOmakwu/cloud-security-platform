SELECT
  eventtime,
  eventname,
  useridentity.arn AS principal_arn,
  sourceipaddress,
  requestparameters
FROM cloudtrail_logs
WHERE eventname IN (
  'AttachRolePolicy',
  'PutUserPolicy',
  'PutRolePolicy',
  'CreatePolicyVersion',
  'SetDefaultPolicyVersion',
  'UpdateAssumeRolePolicy',
  'CreateAccessKey'
)
ORDER BY eventtime DESC;
