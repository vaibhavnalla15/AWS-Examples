## Cerate a Bucket 
```bash
aws s3 mb s3://saul-bucket-policy-example
```

## Create a Bucket Policy JSON File
```bash
aws s3api put-bucket-policy \
--bucket saul-bucket-policy-example \
--policy file://policy.json
```

## In other account, access the bucket
```bash
touch testfile.txt
aws s3 cp testfile.txt s3://saul-bucket-policy-example/
aws s3 ls s3://saul-bucket-policy-example/
```

## Clean up
```bash
aws s3 rm s3://saul-bucket-policy-example/testfile.txt
aws s3 rb s3://saul-bucket-policy-example
```
