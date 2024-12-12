variable "project_id" {
  description = "ID du projet Google Cloud"
  default = "cours-terraform"
}

variable "region" {
  description = "Région de déploiement"
  default     = "europe-west1"
}

variable "service_run_name" {
  description = "Nom du service Cloud Run"
}


variable "repo_name" {
  description = "name du repo dans Artifact Registry"
}


variable "image_name" {
  description = "Le nom de l'image Docker"
  default     = "terra-test"
}

variable "image_tag" {
  description = "Le tag de l'image Docker"
  default     = "latest"
}