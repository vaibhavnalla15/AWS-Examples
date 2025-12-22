# Create Bucket 1
```bash
aws s3 mb s3://cors-fun-bucket
```

## Change Block Public Access Settings
```bash
aws s3api put-public-access-block \
--bucket cors-fun-bucket \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a Bucket Policy
```bash
aws s3api put-bucket-policy --bucket cors-fun-bucket --policy file://policy.json
```

## Turn on Static Website Hosting
```bash
aws s3api put-bucket-website --bucket cors-fun-bucket --website-configuration file://website.json
```

## Upload our index.html file & include a resource that would be cross-origin
```bash
aws s3 cp index.html s3://cors-fun-bucket/index.html 
```

## View the website and see if the index.html is there.
Open a web browser and navigate to: http://cors-fun-bucket.s3-website-us-east-1.amazonaws.com
(Replace "us-east-1" with the appropriate region if necessary)

<hr>

# Create Bucket 2
```bash
aws s3 mb s3://cors-fun2-bucket
```

## Change Block Public Access Settings
```bash
aws s3api put-public-access-block \
--bucket cors-fun2-bucket \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a Bucket Policy
```bash
aws s3api put-bucket-policy --bucket cors-fun2-bucket --policy file://policy2.json
```

## Turn on Static Website Hosting
```bash
aws s3api put-bucket-website --bucket cors-fun2-bucket --website-configuration file://website.json
```

## Upload our text file for CORS testing it will trigger a CORS request
```bash
aws s3 cp test.txt s3://cors-fun2-bucket/test.txt
```

## View the website and see if the test.txt is there.
Open a web browser and navigate to: http://cors-fun2-bucket.s3-website-us-east-1.amazonaws.com
(Replace "us-east-1" with the appropriate region if necessary)

## Set CORS on our bucket
```bash
aws s3api put-bucket-cors --bucket cors-fun2-bucket --cors-configuration file://cors.json
```

## Clean Up
```bash 
aws s3 rb s3://cors-fun-bucket --force
aws s3 rb s3://cors-fun2-bucket --force
``` 
 