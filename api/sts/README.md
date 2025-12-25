# Create a user with no permissions
## We need to create a new user with no permissions and generate out access keys
```bash
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user > secrets.json
```

## Copy the access key and secret here
```bash 
aws configure --profile sts-machine-user
``` 

## Then edit credentials file to change away from default profile
```bash
code ~/.aws/credentials 
```

## Test who you are:
```bash
aws sts get-caller-identity
aws sts get-caller-identity --profile sts-machine-user
```

## Make sure you don't have access to S3
```bash
aws s3 ls --profile sts-machine-user
# You should get an Access Denied error
```

# Creat a Role
## We need to create a role that will access a new resource
```bash
chmod u+x ./bin/deploy
./bin/deploy
```

## Use new user crednetials and assume role

```bash
aws iam put-user-policy \
--user-name sts-machine-user  \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```bash
aws sts assume-role \
    --role-arn arn:aws:iam::640168423955:role/sts-fun-stack-StsRole-YWiyaKyAKkZC \
    --role-session-name s3-sts-fun 
    --profile sts-machine-user 
```

```bash
aws sts get-caller-identity --profile assumed
```

```bash
aws s3 ls --profile assumed
```

## Clean up 
```bash 
aws cloudformation delete-stack --stack-name sts-fun-stack
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy   
aws iam delete-access-key --user-name sts-machine-user --access-key-id AKIAZKDIC6IJXOL72LJ3
aws iam delete-user --user-name sts-machine-user
```
