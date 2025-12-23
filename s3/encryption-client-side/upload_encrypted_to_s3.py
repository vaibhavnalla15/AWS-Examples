import boto3

s3 = boto3.client("s3")

bucket_name = "encrypted-bucket-fun"
file_name = "data.txt.encrypted"

s3.upload_file(file_name, bucket_name, file_name)

print("Encrypted file uploaded to S3.")
