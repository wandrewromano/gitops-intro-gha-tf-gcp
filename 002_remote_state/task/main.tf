terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "training-project-11-f0a7d1-tf-state"
    prefix = "terraform-course/002-remote-state"
    
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "scratch" {
  name                        = "${var.project_id}-002-scratch"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}
