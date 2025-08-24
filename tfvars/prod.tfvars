env = "prod"

# Network
vpc_cidr        = "10.30.0.0/16"
private_subnets = ["10.30.1.0/24", "10.30.2.0/24"]
azs             = ["eu-west-2a", "eu-west-2b"]

# TGW
attach_vpc_ids = {
  "prod-core" = "vpc-yyyyyy"
}
subnet_ids = ["subnet-aaaaaa", "subnet-bbbbbb"]

# EKS
cluster_name       = "prod-eks"
desired_capacity   = 3
min_size           = 3
max_size           = 6
instance_types     = ["t3.large"]
cluster_cidr       = "10.10.0.0/16"
k8s_version        = "1.27"

# Logging
org_logs_bucket = "prod-org-logs-bucket"

# Bootstrap state
state_bucket_name   = "prod-tf-state-bucket"
dynamodb_table_name = "prod-tf-locks"

# Baseline
account_id = "222222222222"
