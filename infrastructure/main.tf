terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "boltbay"
}

variable "default_region" {
  type    = string
  default = "ap-southeast-2"
}

module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  project     = var.project
}

module "security" {
  source = "./modules/security"

  environment = var.environment
  project     = var.project
  vpc_id      = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"

  environment = var.environment
  project     = var.project
  vpc_id      = module.vpc.vpc_id
  # Other required variables
}

module "s3" {
  source = "./modules/s3"

  environment = var.environment
  project     = var.project
}

# Output key information
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}