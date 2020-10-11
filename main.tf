provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_s3_bucket" "main" {
  bucket = "test-spacelift"
  acl    = "private"
  region= "ap-southeast-2"

  lifecycle_rule{
    id="state"
    prefix="state/"
    enabled=true

    noncurrent_version_expiration{
      days=90
    }
  }
}