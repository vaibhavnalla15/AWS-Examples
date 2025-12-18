import boto3

s3 = boto3.client("s3", region_name="us-east-1")
bucket_name = "saul-aws-s3"
s3.create_bucket(Bucket=bucket_name)
print("Bucket created successfully")
