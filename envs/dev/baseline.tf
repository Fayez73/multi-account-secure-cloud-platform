module "baseline" {
  source     = "../../modules/baseline"
  account_id = var.account_id
  region     = "eu-west-2"
}
