terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "****"
  secret_key = "*****"
}

//create VPC
resource "aws_vpc" "intellipaat-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "intellipaat-vpc"
  }
}

//create subnet 1
resource "aws_subnet" "intellipaat-subnet1" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "intellipaat-subnet1"
  }
}

//create subnet 2
resource "aws_subnet" "intellipaat-subnet2" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "intellipaat-subnet2"
  }
}


//create EC2 instance

resource "aws_instance" "server-1" {
  ami           = "ami-0522ab6e1ddcc7055" # ap-south-1, ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.intellipaat-subnet1.id

    tags = {
    Name = "server-1"
  }
}
