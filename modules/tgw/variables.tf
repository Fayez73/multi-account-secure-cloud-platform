variable "env" {
  type        = string
  description = "Environment name (e.g., dev, prod)"
}

variable "attach_vpc_ids" {
  type        = map(string)
  description = "Map of VPC names to VPC IDs to attach to the Transit Gateway"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to use for Transit Gateway attachments"
}
