variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "boltbay"
}

variable "default_region" {
  type    = string
  default = "ap-southeast-2"
}

# VPC configuration variables
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}