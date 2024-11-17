terraform {
  backend "gcs" {
    bucket = "lanchonete-terraform-backend"
    prefix = "secrets_manager/terraform.tfstate"
  }
}
