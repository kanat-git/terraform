provider "aws" {
  region  = "us-east-1"
  profile = "GENERAL"
}

# terraform {
#   backend "s3" {
#     bucket = ""
#     key    = ""
#     region = "us-east-1"
#   }
# }

data "aws_availability_zone" "available" {

}

# S3 module
module "S3" {
  source = "./modules/s3"
  # create_bucket       = var.create_bucket
}

# VPC module
module "vpc" {
  source = "./modules/vpc"

}
