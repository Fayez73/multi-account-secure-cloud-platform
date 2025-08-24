variable "name" {
  type        = string
  description = "Name of the VPC and related network resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones to create subnets in"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, prod)"
}

variable "region" {
  type        = string
  description = "AWS region where the VPC will be created"
}
