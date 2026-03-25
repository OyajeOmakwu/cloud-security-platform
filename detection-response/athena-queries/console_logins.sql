SELECT
  eventtime,
  useridentity.type AS identity_type,
  useridentity.arn AS principal_arn,
  sourceipaddress,
  awsregion,
  responseelements,
  additionaleventdata
FROM cloudtrail_logs
WHERE eventname = 'ConsoleLogin'
ORDER BY eventtime DESC;
