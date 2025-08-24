variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, prod)"
}

variable "region" {
  type        = string
  description = "AWS region where the EKS cluster will be created"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the EKS cluster will reside"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the EKS cluster"
}

variable "cluster_cidr" {
  type        = string
  description = "CIDR block for the EKS cluster networking"
  default     = "10.0.0.0/16"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
  default     = "1.27"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of worker nodes in the EKS node group"
  default     = 2
}

variable "min_size" {
  type        = number
  description = "Minimum number of worker nodes in the node group"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Maximum number of worker nodes in the node group"
  default     = 5
}

variable "instance_types" {
  type        = list(string)
  description = "EC2 instance types for the EKS worker nodes"
  default     = ["t3.medium"]
}
