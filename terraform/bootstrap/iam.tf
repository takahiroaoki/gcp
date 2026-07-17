# For config connector to manipulate GCP resources
resource "google_project_iam_member" "project_editor" {
  project = local.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.bootstrap.email}"
  depends_on = [
    google_service_account.bootstrap,
  ]
}

# For config connector to manipulate Cloud Run's IAM
resource "google_project_iam_member" "cloud_run_admin" {
  project = local.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.bootstrap.email}"
  depends_on = [
    google_service_account.bootstrap,
  ]
}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = "projects/${local.project_id}/serviceAccounts/${google_service_account.bootstrap.email}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${local.project_id}.svc.id.goog[cnrm-system/cnrm-controller-manager]"
  depends_on = [
    google_service_account.bootstrap,
  ]
}