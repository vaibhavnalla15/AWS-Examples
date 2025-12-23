## create a bucket without versioning
```bash
aws s3 mb s3://versioning-fun-example
```

## create a unversioned file
```bash
echo "This is the first version of the file." > example.txt
aws s3 cp example.txt s3://versioning-fun-example/example.txt
```

## Get details about the object
```bash
aws s3api list-object-versions --bucket versioning-fun-example --prefix example.txt
# It shows versionId as null for unversioned objects
```
 
## Enable versioning on the bucket
```bash
aws s3api put-bucket-versioning --bucket versioning-fun-example --versioning-configuration Status=Enabled
```

## Confirm versioning is enabled
```bash
aws s3api get-bucket-versioning --bucket versioning-fun-example
# It should show Status: Enabled
```

## Lets update the file to create new versions
```bash
echo "This is the second version of the file." > example.txt
aws s3 cp example.txt s3://versioning-fun-example/example.txt
```

## Check if file now has versions
```bash
aws s3api list-object-versions --bucket versioning-fun-example --prefix example.txt
# It should show two versions now, one with versionId null and another with a unique versionId
```

## Upload another version
```bash
echo "This is the third version of the file." > example.txt
aws s3 cp example.txt s3://versioning-fun-example/example.txt
```

## We can print out the contents of the s3 file and get the versioning with s3api get-object
```bash
aws s3api get-object --bucket versioning-fun-example --version-id TPTlaT31k5pLpYs81YP2H3FJu3UaCYHm --key example.txt /dev/stdout | cat 
```

## lets delete an object without specifying the version id
```bash
aws s3 rm s3://versioning-fun-example/example.txt
```

## Lets get details of the object again
```bash
aws s3api list-object-versions --bucket versioning-fun-example --prefix example.txt
# It should show a delete marker now along with the previous versions
```

## lets see if we can get the previous version which we technically deleted
```bash
aws s3api get-object --bucket versioning-fun-example --version-id _bCp3QYCQwR_YeHpf.C1mbCXIICtLJAV --key example.txt /dev/stdout | cat 
```

## lets bring back the last version by downloading it and reuploading it aka copy it back
```bash
aws s3api get-object --bucket versioning-fun-example --version-id TPTlaT31k5pLpYs81YP2H3FJu3UaCYHm --key example.txt example_restored.txt
aws s3 cp example_restored.txt s3://versioning-fun-example/example.txt
```

## Clean up
```bash
aws rm example.txt example_restored.txt --recursive
aws s3 rb s3://versioning-fun-example 
```