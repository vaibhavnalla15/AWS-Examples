# Create Cloudwatch Log

```bash
aws logs create-log-group --log-group-name saul-cloudtrail-logs
```

# Create log stream
```bash
aws logs create-log-stream --log-group-name saul-cloudtrail-logs --log-stream-name main
``` 


# Update trail for CloudWatch Logs

```bash
aws cloudtrail update-trail \
--name saul-trail \
--cloud-watch-logs-log-group-arn arn:aws:logs:us-east-1:321869098112:log-group:saul-cloudtrail-logs:* \
--cloud-watch-logs-role-arn arn:aws:iam::321869098112:role/CloudTrail2CloudWatch
```
    