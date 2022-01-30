terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.65.0"
    }
  }
  backend "gcs" {
    bucket = "dge-web-app-terrafrom-state-staging"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "static_website" {
  source              = "../modules/static-website"
  project             = var.project
  website_domain_name = var.website_domain_name
  additional_domain_names = var.additional_domain_names
  not_found_page      = "index.html"
}
