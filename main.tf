provider "aws" {
  region = "us-east-1"
  # shared_credentials_file   = "~/.aws/credentials"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "ksultan-terraform-backend"
    key    = "ksultan.terraform.tfstate"
    region = "us-east-1"
  }
}

# S3 module
module "S3" {
  source = "./modules/s3"

  bucketName   = var.bucketName
  # create_bucket       = var.create_bucket
}

# # VPC module
# module "vpc" {
#   source = "./modules/vpc"

# }

# # EC2 module
# module "ec2" {
#   source  = "./modiles/ec2"
# }
