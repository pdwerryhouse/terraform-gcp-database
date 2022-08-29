terraform {
  required_providers {
    google = {
      source = "google"
    }
  }
}

provider "google" {
  project = var.project
  region = "us-central1"
}
