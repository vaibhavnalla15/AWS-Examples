#! /usr/bin/env bash

# Convert YAML policy to JSON policy    
# yq -o=json policy.yaml > policy.json


# Create IAM Policy Version 
aws iam create-policy-version \
--policy-arn arn:aws:iam::321869098112:policy/My-Fun-Policy \
--policy-document "$(yq -o=json policy.yaml)" \
--set-as-default
