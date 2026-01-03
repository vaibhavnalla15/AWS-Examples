## Convert to JSON

```bash
yq -o=json policy.yaml > policy.json
```

## Create IAM Policy

```bash
aws iam create-policy \
--policy-name My-Fun-Policy \
--policy-document file://policy.json
```



## Attach Policy to user
```bash
aws iam attach-user-policy \
--policy-arn arn:aws:iam::321869098112:policy/My-Fun-Policy \
--user-name AWS-Practice
```

## Delete Policy Versions
```bash
aws iam delete-policy-version --policy-arn arn:aws:iam::321869098112:policy/My-Fun-Policy --version-id v1
aws iam delete-policy-version --policy-arn arn:aws:iam::321869098112:policy/My-Fun-Policy --version-id v2
aws iam delete-policy-version --policy-arn arn:aws:iam::321869098112:policy/My-Fun-Policy --version-id v3
```
