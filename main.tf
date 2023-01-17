terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(object({
    cidr_block = string
    name = string 
  }))
}

variable avail_zone {
  
}

resource "aws_vpc" "my-development-vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
      Name : var.cidr_blocks[0].name
    }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.my-development-vpc.id
    cidr_block = var.cidr_blocks[1].cidr_block
    availability_zone = var.avail_zone
    tags = {
      Name : var.cidr_blocks[1].name
    }
 }




