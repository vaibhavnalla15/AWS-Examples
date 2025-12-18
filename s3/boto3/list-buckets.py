# import boto3

# s3 = boto3.resource("s3")

# for bucket in s3.buckets.all(): # type: ignore
#     print(bucket.name)


# using Low-Level(direct API)
import boto3

s3 = boto3.client("s3")

response = s3.list_buckets()

for bucket in response["Buckets"]:
    print(bucket["Name"])
