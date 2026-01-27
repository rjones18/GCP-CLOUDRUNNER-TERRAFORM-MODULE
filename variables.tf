variable "project_id" {
  type        = string
  description = "GCP project id."
}

variable "location" {
  type        = string
  description = "Cloud Run region, e.g. us-central1."
}

variable "name" {
  type        = string
  description = "Cloud Run service name."
}

variable "image" {
  type        = string
  description = "Container image URL (Artifact Registry or other)."
}

variable "container_port" {
  type        = number
  description = "Container port."
  default     = 8080
}

variable "service_account_email" {
  type        = string
  description = "Service account for the Cloud Run revision."
  default     = null
}

variable "env" {
  type        = map(string)
  description = "Plain environment variables."
  default     = {}
}

variable "cpu" {
  type        = string
  description = "CPU limit, e.g. '1', '2'."
  default     = "1"
}

variable "memory" {
  type        = string
  description = "Memory limit, e.g. '512Mi', '1Gi'."
  default     = "512Mi"
}

variable "concurrency" {
  type        = number
  description = "Max concurrent requests per instance."
  default     = 80
}

variable "timeout_seconds" {
  type        = number
  description = "Request timeout in seconds."
  default     = 300
}

variable "min_instance_count" {
  type        = number
  description = "Min instances (0 enables scale-to-zero)."
  default     = 0
}

variable "max_instance_count" {
  type        = number
  description = "Max instances."
  default     = 10
}

variable "ingress" {
  type        = string
  description = "Ingress: INGRESS_TRAFFIC_ALL | INGRESS_TRAFFIC_INTERNAL_ONLY | INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
  default     = "INGRESS_TRAFFIC_ALL"
}

variable "invoker_members" {
  type        = list(string)
  description = "IAM members granted roles/run.invoker (e.g. ['user:me@example.com'])."
  default     = []
}

variable "allow_unauthenticated" {
  type        = bool
  description = "If true, grants allUsers roles/run.invoker (public)."
  default     = false
}
