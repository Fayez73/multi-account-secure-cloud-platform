variable "org_logs_bucket" {
  type        = string
  description = "Name of the S3 bucket for centralized organization logs"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, prod)"
}

variable "region" {
  type        = string
  description = "AWS region for the logs bucket"
}
