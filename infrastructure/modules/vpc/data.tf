#infrastructure/modules/vpc/data.tf

data "aws_availability_zones" "available" {
  state = "available"
}