variable "project_id" {
  type        = string
  description = "GCP project ID where Cloud Run will be deployed."
}

variable "location" {
  type        = string
  description = "GCP region for Cloud Run (e.g. us-central1)."
}

variable "image_tag" {
  type        = string
  description = "Container image tag to deploy."
  default     = "latest"
}

variable "environment" {
  type        = string
  description = "Deployment environment name."
  default     = "dev"
}

variable "invoker_email" {
  type        = string
  description = "Email allowed to invoke the Cloud Run service."
  default     = null
}
