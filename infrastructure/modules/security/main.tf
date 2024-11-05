module "security_groups" {
  source = "./modules/security"
  
  vpc_id = module.vpc.vpc_id
  environment = var.environment
}