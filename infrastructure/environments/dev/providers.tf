variable "default_region" {
  type    = string
  default = "ap-southeast-2"
}

provider "aws" {
  region = var.default_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "terraform"
    }
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}