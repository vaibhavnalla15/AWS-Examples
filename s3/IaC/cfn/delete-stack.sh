#! /bin/bash

echo "===== delete stack for s3 bucket via CFN ====="

STACK_NAME="cfn-s3-simple"

aws cloudformation delete-stack \
--region us-east-1 \
--stack-name $STACK_NAME    

# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
  echo "Stack leleted successfully"
else
  echo "Stack deletion failed"
fi







