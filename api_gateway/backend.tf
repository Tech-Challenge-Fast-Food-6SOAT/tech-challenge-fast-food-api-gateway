terraform {
  backend "gcs" {
    bucket = "lanchonete-terraform-backend"
    prefix = "api_gateway/terraform.tfstate"
  }
}
