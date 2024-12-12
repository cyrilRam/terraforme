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

