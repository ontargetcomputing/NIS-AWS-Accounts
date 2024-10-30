terraform {
  required_version = ">= 1.9.8"

  cloud {
    organization = var.TF_ORGANIZATION

    workspaces {
      name = var.TF_WORKSPACE
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.67.0" 
    }
  }
}
