# infrastructure/environments/dev/main.tf

# VPC Module - Base networking infrastructure
module "vpc" {
  source = "../../modules/vpc"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Description = "Main VPC for ${var.environment} environment"
  }
}

# Security Module - Network security groups
module "security" {
  source = "../../modules/security"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id

  tags = {
    Description = "Security groups for ${var.environment} environment"
  }

  depends_on = [module.vpc]
}

# Outputs for important resource information
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "IDs of the private subnets"
}