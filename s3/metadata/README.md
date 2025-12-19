## Create a Bucket

```sh
aws s3 mb s3://metadata-example-bucket
```
## Create a file to upload

```sh
echo "This is an example file for S3 metadata." > examplefile.txt
```
## Upload the file with custom metadata

```sh
aws s3api put-object \
--bucket metadata-example-bucket \
--key examplefile.txt \
--body examplefile.txt \
--metadata author="Jane Doe",description="Sample file for S3 metadata example"
```

## Get Metadata using head-object

```sh
aws s3api head-object \
--bucket metadata-example-bucket \
--key examplefile.txt
```

