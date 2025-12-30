## Before creating NACL, grab VPC ID
```bash
aws ec2 describe-vpcs \
--query 'Vpcs[1].VpcId' \  # Adjust the index [1] as needed, depending on which VPC you want to select. [0] is the default VPC.
--output text
```

## Creating NACL
```bash

aws ec2 create-network-acl \
--vpc-id vpc-0b93ca4592af18c95 
``` 

## Get AMI For Amazon Linux 2023
```bash
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images | sort_by(@, &CreationDate)[-1].ImageId" \
--region us-east-1 \
--output text

```

## Get NACL ID
```bash
aws ec2 describe-network-acls \
--filters "Name=association.subnet-id,Values=subnet-07761e3b1b18be550" \
--query 'NetworkAcls[*].NetworkAclId' \
--output text
```

## Block Inboud traffic on specific IP
```bash
aws ec2 create-network-acl-entry \
--network-acl-id acl-00f1543663463afa8 \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=-1,To=65535 \
--cidr-block 106.213.82.142/32 \
--rule-action deny
```
