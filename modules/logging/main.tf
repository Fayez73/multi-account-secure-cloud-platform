resource "aws_s3_bucket" "org_logs" {
  bucket = var.org_logs_bucket
  acl    = "private"
  versioning {
    enabled = true
  }


  tags = {
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}



