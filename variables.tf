variable "region" {
  type    = string
  default = "us-east-1"

}

# variable "create_bucket" {
#   type = "string"
# }

variable "bucketName" {
  type = string
  description = "S3 bucket describe your variable"
}