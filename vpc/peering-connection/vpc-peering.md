# Peering VPCs A & B

# Get VPC IDs for VPC A
```bash
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=A-vpc" \
--query "Vpcs[0].VpcId" \
--output text
# vpc-02f415b793ad5d016
```

# Get VPC IDs for VPC B
```bash
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=B-vpc" \
--query "Vpcs[0].VpcId" \
--output text
# vpc-0225b38e09ad315c3
```

# Create VPC Peering Connection
```bash
aws ec2 create-vpc-peering-connection \
--vpc-id vpc-02f415b793ad5d016 \
--peer-vpc-id vpc-0225b38e09ad315c3 \
--tag-specifications 'ResourceType=vpc-peering-connection,Tags=[{Key=Name,Value=A-B-peering}]'
```

# Accept VPC Peering Connection
# Before that get the VPC Peering Connection ID 
```bash
aws ec2 describe-vpc-peering-connections \
--query 'VpcPeeringConnections[*].VpcPeeringConnectionId' \
--output text
# pcx-00509fe6536f34131
```

# Now accept the peering connection
```bash
aws ec2 accept-vpc-peering-connection \
--vpc-peering-connection-id pcx-00509fe6536f34131
```

# Get Route Tables for VPC A
```bash
aws ec2 describe-route-tables \
--filters "Name=tag:Name,Values=A-rtb-public" \
--query "RouteTables[0].RouteTableId" \
--output text
# rtb-07488eddd42da9bfa
```
# Get Route Tables for VPC B
```bash
aws ec2 describe-route-tables \
--filters "Name=tag:Name,Values=B-rtb-public" \
--query "RouteTables[0].RouteTableId" \
--output text
# rtb-06f8f66ba2644297a
```

# Add Routes to VPC A Route Table
```bash
aws ec2 create-route \
--route-table-id rtb-07488eddd42da9bfa \
--destination-cidr-block 12.0.0.0/16 \
--vpc-peering-connection-id pcx-00509fe6536f34131
```

# Add Routes to VPC B Route Table
```bash
aws ec2 create-route \
--route-table-id rtb-06f8f66ba2644297a \
--destination-cidr-block 10.0.0.0/16 \
--vpc-peering-connection-id pcx-00509fe6536f34131
```