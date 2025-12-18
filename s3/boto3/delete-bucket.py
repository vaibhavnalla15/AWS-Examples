import boto3

bucket_name = "my-boto3-demo-bucket-123456"

s3 = boto3.resource("s3")
bucket = s3.Bucket(bucket_name) # type:ignore

# check if objects exist
objects = list(bucket.objects.all())

if objects:
    print("Objects are present. Bucket can't be deleted. Deleting objects first...")
    bucket.objects.all().delete()

bucket.delete()
print("Bucket deleted successfully")
