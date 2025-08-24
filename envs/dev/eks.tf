module "eks" {
  source             = "../../modules/eks"
  cluster_name       = var.cluster_name
  env                = var.env
  region             = "eu-west-2"
  vpc_id             = module.network_core.vpc_id
  private_subnet_ids = module.network_core.private_subnet_ids
  cluster_cidr       = var.cluster_cidr
  k8s_version        = var.k8s_version
  desired_capacity   = var.desired_capacity
  min_size           = var.min_size
  max_size           = var.max_size
  instance_types     = var.instance_types
}
