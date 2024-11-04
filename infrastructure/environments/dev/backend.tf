# infrastructure/environments/dev/backend.tf

terraform {
  backend "s3" {
    bucket         = "boltbay-infra-tfstate"
    key            = "environments/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "boltbay_tf_lockid"
  }
}