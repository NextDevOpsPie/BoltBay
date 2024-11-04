terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         	   = "boltbay-infra-tfstate"
    key              	 = "state/terraform.tfstate"
    region         	   = "ap-southeast-2"
    encrypt        	   = true
    dynamodb_table     = "boltbay_tf_lockid"
  }
}

variable "default_region" {
  type = string
  default = "ap-southeast-2"
}

provider "aws" {
  region = var.default_region
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "boltbay-test"
  tags = {
    created_by  = "terraform"
    project     = "boltbay"
  }
}