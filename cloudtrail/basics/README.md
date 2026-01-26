# Create a Bucket for CloudTrail Logs
```bash
aws s3 mb s3://saul-s3-26-01
```

# Create a Bucket Policy to Allow CloudTrail to Write to the S3 Bucket

```bash
aws s3api put-bucket-policy \
--bucket saul-s3-26-01 \
--policy file://bucket-policy.json
```

# Create a Trail 

```bash
aws cloudtrail create-trail \
--name saul-trail \
--s3-bucket-name saul-s3-26-01 \
--region us-east-1
```

# Start Logging

```bash
aws cloudtrail start-logging \
--name saul-trail
```