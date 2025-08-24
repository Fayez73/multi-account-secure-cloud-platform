variable "state_bucket_name" {
  type        = string
  description = "Name of the S3 bucket to store Terraform state"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table for Terraform state locking"
}

variable "region" {
  type        = string
  description = "AWS region to create the S3 bucket and DynamoDB table"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, prod)"
}
