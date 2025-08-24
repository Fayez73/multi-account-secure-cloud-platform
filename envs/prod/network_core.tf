module "network_core" {
  source          = "../../modules/network-core"
  name            = "dev-core"
  env             = var.env
  region          = "eu-west-2"
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  azs             = var.azs
}
