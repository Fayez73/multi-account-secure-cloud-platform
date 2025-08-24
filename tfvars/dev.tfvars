env = "dev"

# Network
vpc_cidr        = "10.20.0.0/16"
private_subnets = ["10.20.1.0/24", "10.20.2.0/24"]
azs             = ["eu-west-2a", "eu-west-2b"]

# TGW
attach_vpc_ids = {
  "dev-core" = "vpc-xxxxxx"
}
subnet_ids = ["subnet-xxxxxx", "subnet-yyyyyy"]

# EKS
cluster_name       = "dev-eks"
desired_capacity   = 2
min_size           = 2
max_size           = 5
instance_types     = ["t3.medium"]
cluster_cidr       = "10.0.0.0/16"
k8s_version        = "1.27"

# Logging
org_logs_bucket = "dev-org-logs-bucket"

# Bootstrap state
state_bucket_name   = "dev-tf-state-bucket"
dynamodb_table_name = "dev-tf-locks"

# Baseline
account_id = "111111111111"
