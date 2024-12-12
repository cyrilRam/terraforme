terraform {
  backend "gcs" {
    bucket = "cours-terraform-tfstate"
    prefix = "env/prod"
  }
}
