locals {
  region = "us-central1"
  repo_name="dev-repo"
  project_id="cours-terraform"
  run_service_name="test-terra-app-dev"
  image_name="test-terra-docker"
  tag="latest"
}

module "artifact_registry" {
  source     = "./../../modules/artifactory"
  project_id = local.project_id
  region     = local.region
  repo_name  = local.repo_name
}

module "activate_api"{
  source     = "./../../modules/api"
  project_id = local.project_id
}

module "cloud_run_service"{
  source     = "./../../modules/run"
  region = local.region
  project_id = local.project_id
  run_service_name=local.run_service_name
  image_name = local.image_name
  repo_name = local.repo_name
  tag = local.tag
}