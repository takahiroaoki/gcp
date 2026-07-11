module "argocd" {
  source       = "../modules/cluster"
  project_id   = local.project_id
  region       = local.region
  cluster_name = "argocd-${local.env}"
}

resource "google_service_account" "argocd" {
  project      = local.project_id
  account_id   = "argocd-${local.env}"
  display_name = "argocd-${local.env}"
}

# For config connector to manipulate GCP resources
resource "google_project_iam_member" "project_editor" {
  project = local.project_id
  role    = "roles/editor"
  member  = "serviceAccount:argocd-${local.env}@${local.project_id}.iam.gserviceaccount.com"
  depends_on = [
    google_service_account.argocd,
  ]
}

# For config connector to manipulate Cloud Run's IAM
resource "google_project_iam_member" "cloud_run_admin" {
  project = local.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:argocd-${local.env}@${local.project_id}.iam.gserviceaccount.com"
  depends_on = [
    google_service_account.argocd,
  ]
}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = "projects/${local.project_id}/serviceAccounts/argocd-${local.env}@${local.project_id}.iam.gserviceaccount.com"
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${local.project_id}.svc.id.goog[cnrm-system/cnrm-controller-manager]"
  depends_on = [
    google_service_account.argocd,
  ]
}