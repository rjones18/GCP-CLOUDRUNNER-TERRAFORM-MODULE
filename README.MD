# GCP CloudRunner Terraform Module

This repository contains a reusable **Terraform module** to deploy applications to **Google Cloud Run**, Google’s fully managed serverless container platform. By providing a standardized interface for Cloud Run services, this module simplifies infrastructure automation and enables repeatable deployments.

## 🚀 Overview

Google Cloud Run is a serverless compute platform that runs stateless containers and automatically scales based on traffic. This Terraform module provides the building blocks for defining and provisioning Cloud Run services, including options for environment variables, IAM configuration, and custom domain mapping.

Terraform modules are reusable blocks of configuration that encapsulate resources and logic to help you provision infrastructure consistently across environments.

---

## 📦 Features

- Provision a **Cloud Run Service** with desired container image  
- Configure environment variables for workloads  
- Set up IAM roles and permissions for service invocation  
- Optional support for **custom domain mappings**
- Lightweight and modular — can be included in larger IaC projects

---

## 📘 Prerequisites

Before using this module, ensure:

- You have a Google Cloud project with billing enabled  
- Required APIs are activated:
  - `run.googleapis.com`  
- Terraform v1.3+ and GCP Terraform provider installed

---

## 🧠 Usage Example

Below is a basic example of how to consume this module in Terraform:

```hcl
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
