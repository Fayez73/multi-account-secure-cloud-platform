variable "name" { type = string }
variable "vpc_cidr" { type = string }
variable "private_subnets" { type = list(string) }
variable "azs" { type = list(string) }
variable "env" { type = string }
variable "region" { type = string }
