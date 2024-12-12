variable "project_id" {
  description = "ID du projet Google Cloud"
}

variable "region" {
  description = "Région de déploiement"
  default     = "europe-west1"
}

variable "service_name" {
  description = "Nom du service Cloud Run"
}

variable "image_url" {
  description = "URL de l'image Docker dans Artifact Registry"
}


