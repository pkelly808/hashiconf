module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "asif-s3-bucket-${var.environment}"
  acl    = "private"

  versioning = {
    enabled = true
  }
}
