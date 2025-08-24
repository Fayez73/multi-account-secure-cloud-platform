resource "aws_s3_bucket" "org_logs" {
  bucket = var.org_logs_bucket
  acl    = "private"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}
