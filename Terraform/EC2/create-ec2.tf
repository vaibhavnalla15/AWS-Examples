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

# Creating EC2 Instance
resource "aws_instance" "demo-instance" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"

  tags = {
    Name = "fun-instance"
  }
}

# Create a VPC
resource "aws_vpc" "fun-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "fun-vpc"
  }
}