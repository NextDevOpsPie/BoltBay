# infrastructure/environments/dev/variables.tf

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "project_name" {
  type        = string
  default     = "boltbay"
  description = "Project name"
}

variable "default_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "Default AWS region for resources"
}

# VPC configuration variables
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for VPC"
  
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid VPC CIDR block."
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "List of private subnet CIDR blocks"
}