module "artifact_registry" {
  source     = "./../../modules/artifactory"
  project_id = var.project_id
  region     = var.region
  repo_name  = var.repo_name
}

module "activate_api"{
  source     = "./../../modules/api"
  project_id = var.project_id
}

module "cloud_run_service"{
  source     = "./../../modules/run"
  region = var.region
  project_id = var.project_id
  run_service_name=var.run_service_name
  image_name = var.image_name
  repo_name = var.repo_name
  tag = var.tag
}