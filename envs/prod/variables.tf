variable "env" {
  type        = string
  description = "Environment name (dev, prod, etc.)"
}

# Network
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones for subnets"
}

# TGW
variable "attach_vpc_ids" {
  type        = map(string)
  description = "Map of VPC names to VPC IDs for TGW attachments"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for TGW attachments"
}

# EKS
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "min_size" {
  type        = number
  description = "Minimum number of worker nodes"
}

variable "max_size" {
  type        = number
  description = "Maximum number of worker nodes"
}

variable "instance_types" {
  type        = list(string)
  description = "List of EC2 instance types for worker nodes"
}

variable "cluster_cidr" {
  type        = string
  description = "CIDR block for EKS cluster networking"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version for the cluster"
}

# Logging
variable "org_logs_bucket" {
  type        = string
  description = "Name of the organization logging bucket"
}

# Bootstrap state
variable "state_bucket_name" {
  type        = string
  description = "S3 bucket for Terraform remote state"
}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table for Terraform state locking"
}

# Baseline
variable "account_id" {
  type        = string
  description = "AWS account ID for baseline resources"
}
