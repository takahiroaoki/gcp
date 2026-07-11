module "setup" {
  source     = "../modules/setup"
  project_id = local.project_id
  region     = local.region
  env        = local.env
}