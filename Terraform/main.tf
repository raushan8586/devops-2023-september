terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

#create VPC
resource "aws_vpc" "intellipaat-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "intellipaat-vpc"
  }
}

#create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}

#create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_instance" "server-1" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"

  tags = {
    Name = "server-1"
  }
}
