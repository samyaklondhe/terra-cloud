terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

resource "aws_instance" "myinstance" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "myinstance-${count.index + 1}"
  }
}
