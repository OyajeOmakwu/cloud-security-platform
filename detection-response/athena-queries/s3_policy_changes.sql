SELECT eventtime, useridentity.arn, requestparameters
FROM cloudtrail_logs
WHERE eventname = 'PutBucketPolicy';