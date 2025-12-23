## Create a new S3 bucket
```bash
aws s3 mb s3://encrypted-bucket-fun
```

## Create a file to upload
```bash
echo "This is John Wick" > wick.txt
```

## Upload the file to the S3 bucket using client-side encryption
```bash
python upload_encrypted_to_s3.py wick.txt encrypted-bucket-fun wick.txt.encrypted secret.key
```

## Download and decrypt the file from the S3 bucket
```bash
python download_and_decrypt.py encrypted-bucket-fun wick.txt.encrypted decrypted_wick.txt secret.key
```

## Verify the decrypted file
```bash
cat decrypted_wick.txt
```

## Generate a symmetric key for encryption
```bash
python generate_key.py secret.key
```

## Encrypt a file locally
```bash
python encrypt_file.py wick.txt wick.txt.encrypted secret.key
```

## Download the encrypted file from S3
```bash
aws s3 cp s3://encrypted-bucket-fun/wick.txt.encrypted downloaded.encrypted
```

## Decrypt the downloaded file
```bash
python download_and_decrypt.py encrypted-bucket-fun wick.txt.encrypted decrypted_data.txt secret.key
```

## Clean up - Delete the S3 bucket and its contents
```bash
aws s3 rm s3://encrypted-bucket-fun --recursive
aws s3 rb s3://encrypted-bucket-fun
```