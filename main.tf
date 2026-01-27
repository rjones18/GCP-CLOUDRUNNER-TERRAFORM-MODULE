resource "google_cloud_run_v2_service" "this" {
  name     = var.name
  location = var.location
  project  = var.project_id

  ingress = var.ingress

  template {
    service_account = var.service_account_email
    timeout         = "${var.timeout_seconds}s"
    max_instance_request_concurrency = var.concurrency

    scaling {
      min_instance_count = var.min_instance_count
      max_instance_count = var.max_instance_count
    }

    containers {
      image = var.image

      ports {
        container_port = var.container_port
      }

      resources {
        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
      }

      dynamic "env" {
        for_each = var.env
        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }
}

# --- IAM: invoker (private vs public) ---
resource "google_cloud_run_v2_service_iam_member" "invokers" {
  for_each = toset(var.invoker_members)

  project  = var.project_id
  location = var.location
  name     = google_cloud_run_v2_service.this.name

  role   = "roles/run.invoker"
  member = each.value
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  count   = var.allow_unauthenticated ? 1 : 0
  project = var.project_id
  location = var.location
  name    = google_cloud_run_v2_service.this.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
