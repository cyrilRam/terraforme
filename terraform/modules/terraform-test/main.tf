# Activer les services nécessaires
resource "google_project_service" "enable_services" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com"
  ])
  service = each.value
  project = var.project_id
}

# Créer le dépôt Artifact Registry
resource "google_artifact_registry_repository" "artifact_repo" {
  location      = var.region
  repository_id = var.repo_name
  description   = "Dépôt pour stocker les images Docker de l'application"
  format        = "DOCKER"
}

# Déployer le service Cloud Run
resource "google_cloud_run_service" "my_service" {
  name     = var.service_run_name
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repo_name}/${var.image_name}:${var.image_tag}"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Donner l'accès public au service Cloud Run
resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.my_service.name
  location = google_cloud_run_service.my_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
