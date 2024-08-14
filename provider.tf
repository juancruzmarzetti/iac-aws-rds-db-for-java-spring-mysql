terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
# funcionalidad para ejecución automatizada con pipeline en gitlab
#  backend "http" {
#    address        = "https://gitlab.com/api/v4/projects/${var.project_id}/terraform/state/default"
#    lock_address   = "https://gitlab.com/api/v4/projects/${var.project_id}/terraform/state/default/lock"
#    unlock_address = "https://gitlab.com/api/v4/projects/${var.project_id}/terraform/state/default/lock"
#  }
}

provider "aws" {
  region = "us-east-1"
}