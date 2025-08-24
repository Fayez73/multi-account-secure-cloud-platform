module "tgw" {
  source        = "../../modules/tgw"
  env           = var.env
  attach_vpc_ids = var.attach_vpc_ids
  subnet_ids     = var.subnet_ids
}
