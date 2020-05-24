data "aws_caller_identity" "current" {

}

resource "aws_s3_bucket" "tb_site_bucket" {
  bucket = "mykanatsultan"
}
