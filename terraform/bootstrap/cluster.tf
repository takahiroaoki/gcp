module "bootstrap" {
  source       = "../modules/cluster"
  project_id   = local.project_id
  region       = local.region
  cluster_name = "bootstrap-${local.env}"
}