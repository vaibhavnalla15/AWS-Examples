terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "terraform_queue" {
  name                       = "tf-queue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600 # 4 days
}