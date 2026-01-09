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

variable "subnet_prefix" {
  description = "cidr block for the subnet"
}

# Create a VPC
resource "aws_vpc" "fun-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "fun-vpc"
  }
}
# Create a Subnet
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.fun-vpc.id
  cidr_block = var.subnet_prefix

  tags = {
    Name = "subnet-1"
  }
}