import boto3
import os

bucket_name = "my-boto3-demo-bucket-123456"
file_path = os.path.join("AWS-Examples", "S3", "boto3", "test.txt")
object_key = "test.txt"

s3 = boto3.resource("s3")
bucket = s3.Bucket(bucket_name) # type:ignore
bucket.upload_file(file_path, object_key)

print("Objects uploaded successfully")

