resource "google_storage_bucket" "terraform_state" {
  name     = module.setup.backend_bucket
  project  = local.project_id
  location = "ASIA"
  versioning {
    enabled = true
  }
}