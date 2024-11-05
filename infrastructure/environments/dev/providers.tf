# infrastructure/environments/dev/providers.tf

provider "aws" {
  region = var.default_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "terraform"
      CreatedBy   = "terraform"
      Workspace   = terraform.workspace
    }
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "terraform"
      CreatedBy   = "terraform"
      Workspace   = terraform.workspace
    }
  }
}