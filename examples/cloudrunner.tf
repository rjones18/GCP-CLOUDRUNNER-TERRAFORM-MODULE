provider "google" {
  project = var.project_id
  region  = var.location
}

module "api" {
  source = "../"

  project_id = var.project_id
  location   = var.location
  name       = "my-weather-app"
  image      = "gcr.io/alert-flames-286515/simple-go-app:addb71f"
  service_account_email  = google_service_account.cloud_run_sa.email

  env = {
    ENVIRONMENT = "dev"
    LOG_LEVEL   = "info"
  }

  min_instance_count = 0
  max_instance_count = 5

  # Option A: private service, grant specific callers:
  # invoker_members = [
  #   "user:reggie@example.com"
  # ]

  # Option B: make it public:
  # allow_unauthenticated = true
}
