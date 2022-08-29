terraform {
  required_providers {
    google = {
      source = "google"
    }
  }
}

provider "google" {
  project = "xxx"
  region = "us-central1"
}
