module "bootstrap_state" {
  source              = "../../modules/bootstrap-state"
  region              = "eu-west-2"
  state_bucket_name   = var.state_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  env                 = var.env
}
