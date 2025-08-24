module "logging" {
  source          = "../../modules/logging"
  org_logs_bucket = var.org_logs_bucket
  env             = var.env
  region          = "eu-west-2"
}
