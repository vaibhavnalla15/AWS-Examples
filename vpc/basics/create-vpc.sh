#!/usr/bin/env bash

set -e

# Step 1:- Create VPC
VPC_ID=$(aws ec2 create-vpc \
--cidr-block "172.1.0.0/16" \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=my-vpc-cli}]' \
--region us-east-1 \
--query Vpc.VpcId \
--output text)

echo "VPC_ID: $VPC_ID"

# Turn on DNS hostnames
aws ec2 modify-vpc-attribute \
--vpc-id $VPC_ID \
--enable-dns-hostnames "{\"Value\":true}"   

# Step 2:- create a new subnet
SUBNET_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block "172.1.1.0/20" \
--query Subnet.SubnetId \
--output text)

echo "SUBNET_ID: $SUBNET_ID"

# auto assign public IP IPv4 on subnet
aws ec2 modify-subnet-attribute \
--subnet-id $SUBNET_ID \
--map-public-ip-on-launch

# Step 3:- create a route table & explicitly associate the subnet with the route table
RTB_ID=$(aws ec2 describe-route-tables \
--filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" \
--query RouteTables[0].RouteTableId \
--output text)

echo "RTB_ID: $RTB_ID"

# associate the subnet with the route table
ASSOC_ID=$(aws ec2 associate-route-table \
--route-table-id $RTB_ID \
--subnet-id $SUBNET_ID \
--query AssociationId \
--output text)

# Step 4:- create and attach an Internet Gateway (IGW)
# create an IGW
IGW_ID=$(aws ec2 create-internet-gateway \
--query InternetGateway.InternetGatewayId \
--output text)

echo "IGW_ID: $IGW_ID"

# attach an IGW to our VPC
aws ec2 attach-internet-gateway \
--internet-gateway-id $IGW_ID \
--vpc-id $VPC_ID

# add a route to the IGW
aws ec2 create-route \
--route-table-id $RTB_ID \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id $IGW_ID

echo "VPC with ID $VPC_ID created successfully."

# print the values to use in delete-vpc.sh
echo "VPC_ID=$VPC_ID"
echo "IGW_ID=$IGW_ID"
echo "SUBNET_ID=$SUBNET_ID"
echo "ASSOC_ID=$ASSOC_ID"
echo "RT_ID=$RTB_ID"    

echo "To delete the VPC, run: ./delete-vpc.sh $VPC_ID $IGW_ID $SUBNET_ID $ASSOC_ID $RTB_ID"