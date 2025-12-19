## Create a new S3 Bucket

```md
aws s3 mb s3://checksum-example-saul
```

## Create a file that we will checksum on

```
echo "This is John wick. Yeah!" > johnwick.txt
```

## Get a checksum of a file for md5

```md
md5sum ./johnwick.txt
672edf79d47caa0680675d72a74e098f \*./johnwick.txt
```

## Upload the file to S3 & look at its etag

```md
aws s3 cp johnwick.txt s3://checksum-example-saul/johnwick
aws s3api head-object --bucket checksum-example-saul --key johnwick.txt --query ETag
```

## Lets upload existin file wiht different checksum

```python
import zlib
with open("johnwick.txt","rb") as f:
    print(zlib.crc32(f.read()))
```

```sh
aws s3api put-object \
--bucket="checksum-example-saul" \
--key="johnwick.txt" \
--body="johnwick.txt" \
--checksum-algorithm="CRC32" \
--checksum-crc32="3183459150"
```
