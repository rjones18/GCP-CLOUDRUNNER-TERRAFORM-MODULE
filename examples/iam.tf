# Create a Cloud Run runtime service account
resource "google_service_account" "cloud_run_sa" {
  project      = var.project_id
  account_id   = "cloud-run-${var.environment}"
  display_name = "Cloud Run SA (${var.environment})"
}

# Grant access to specific secrets only (least privilege)
# Secret IDs must already exist (or you can create them with google_secret_manager_secret)
resource "google_secret_manager_secret_iam_member" "secret_access" {
  for_each = toset(var.secret_ids)

  project   = var.project_id
  secret_id = each.value
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.cloud_run_sa.email}"
}

# Optional: allow reading secret versions metadata (sometimes helpful)
# Usually not required—secretAccessor is enough for accessSecretVersion.
