# Call VPC module
module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"
  
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# Call Security module
module "security" {
  source = "../../modules/security"
  
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

# Add additional module calls as needed