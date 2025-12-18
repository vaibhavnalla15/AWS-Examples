# # using Resource
import boto3

bucket_name = "my-boto3-demo-bucket-123456"

s3 = boto3.resource("s3")
bucket = s3.Bucket(bucket_name) # type: ignore

for obj in bucket.objects.all():
    if obj in bucket.objects.all():
        print(obj.key)
    else:
        print("This bucket is empty")


# Client

# import boto3

# bucket_name = "my-boto3-demo-bucket-123456"

# s3 = boto3.client("s3")

# response = s3.list_objects_v2(Bucket=bucket_name)

# if "Contents" in response:
#     for obj in response["Contents"]:
#         print(obj["Key"])
#     else:
#         print("This bucket is empty")
