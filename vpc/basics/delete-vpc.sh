#!/usr/bin/env bash

# Check if the argument (VPC ID) is provided
if [ -z "$1" ]; then
    echo "Argument not provided. Please provide the VPC ID to delete."
else 
    export VPC_ID=$1
fi

echo "Deleting VPC with ID: $VPC_ID"

if [ -z "$2" ]; then
    echo "Argument not provided."
else 
    export IGW_ID=$2
fi

if [ -z "$3" ]; then
    echo "Argument not provided."
else 
    export SUBNET_ID=$3
fi

if [ -z "$4" ]; then
    echo "Argument not provided."
else 
    export ASSOC_ID=$4
fi

if [ -z "$5" ]; then
    echo "Argument not provided."
else 
    export RT_ID=$5
fi


# detach the IGW
aws ec2 detach-internet-gateway \
--internet-gateway-id $IGW_ID \
--vpc-id $VPC_ID

# disassociate the subnet from the route table
aws ec2 disassociate-route-table \
--association-id $ASSOC_ID \

# delete the subnet
aws ec2 delete-subnet \
--subnet-id $SUBNET_ID \

# # delete the route table
# aws ec2 delete-route-table \
# --route-table-id $RT_ID \

# delete our vpc using the VPC ID
aws ec2 delete-vpc \
--vpc-id $VPC_ID \

