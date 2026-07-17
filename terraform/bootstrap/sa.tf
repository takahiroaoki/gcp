resource "google_service_account" "bootstrap" {
  project      = local.project_id
  account_id   = "bootstrap-${local.env}"
  display_name = "Bootstrap Service Account"
}