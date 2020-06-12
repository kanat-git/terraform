data "aws_caller_identity" "current" {}

variable "bucketName" {
  type              = string
  description       = "The test bucket"  
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucketName
}
