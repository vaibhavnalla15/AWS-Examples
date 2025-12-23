## Create a bucket 
```bash
aws s3 mb s3://encryption-fun-examples 
```

## Create a file to upload
```bash
aws s3 cp test.txt s3://encryption-fun-examples/test.txt
```

## Put an Object with SSE-C via aws s3
```bash
openssl rand -out ssec.key 32

aws s3 cp test.txt s3://encryption-fun-examples/test.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```

## Get an Object with SSE-C via aws s3
```bash
aws s3 cp s3://encryption-fun-examples/test.txt test.txt --sse-c AES256 --sse-c-key fileb://ssec.key
```

## We learned with steps included in this example
- How to use SSE-C to encrypt and decrypt objects in S3 via AWS CLI
- How to generate a random encryption key using OpenSSL
- How to upload and download files to/from S3 with server-side encryption using customer-provided keys (SSE-C)
- The importance of securely managing and storing encryption keys when using SSE-C
- The syntax and options available in the AWS CLI for working with SSE-C encryption
- Best practices for using SSE-C to ensure data security and compliance in S3

## Clean up
```bash
aws s3 rb s3://encryption-fun-examples --force
```