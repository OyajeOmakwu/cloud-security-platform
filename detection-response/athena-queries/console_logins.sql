SELECT eventtime, useridentity.arn, sourceipaddress, responseelements
FROM cloudtrail_logs
WHERE eventname = 'ConsoleLogin';