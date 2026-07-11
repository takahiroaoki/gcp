module "setup" {
  source     = "../modules/setup"
  project_id = local.project_id
  region     = local.region
  env        = local.env
}

terraform {
  backend "gcs" {
    bucket = "playground-502010-tfstate-bucket"
    prefix = "google"
  }
}