SELECT
  eventtime,
  useridentity.arn AS principal_arn,
  sourceipaddress,
  eventname,
  requestparameters
FROM cloudtrail_logs
WHERE eventname IN ('PutBucketPolicy', 'PutBucketAcl', 'PutBucketPublicAccessBlock')
ORDER BY eventtime DESC;
