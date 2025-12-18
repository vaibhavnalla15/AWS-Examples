#! /bin/bash

echo "=====s3 bucket via CloudFormation(CFN)====="

STACK_NAME="cfn-s3-simple"

aws cloudformation deploy \
--template-file template.yml \
--region us-east-1 \
--stack-name $STACK_NAME    

# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
  echo "Stack created successfully"
else
  echo "Stack creation failed"
fi