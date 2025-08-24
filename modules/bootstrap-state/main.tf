resource "aws_s3_bucket" "tf_state" {
  bucket = var.state_bucket_name
  tags = {
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}
