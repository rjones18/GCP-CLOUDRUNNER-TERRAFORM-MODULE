provider "google" {
  project = var.project_id
  region  = var.location
}

module "api" {
  source = "../"

  project_id = var.project_id
  location   = var.location
  name       = "my-api"
  image      = "us-central1-docker.pkg.dev/my-proj/my-repo/my-api:1.0.0"

  env = {
    ENVIRONMENT = "dev"
    LOG_LEVEL   = "info"
  }

  min_instance_count = 0
  max_instance_count = 5

  # Option A: private service, grant specific callers:
  invoker_members = [
    "user:reggie@example.com"
  ]

  # Option B: make it public:
  # allow_unauthenticated = true
}
