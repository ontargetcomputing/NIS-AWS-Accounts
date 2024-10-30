terraform {
  required_version = ">= 1.9.8"

  cloud {
    organization = "balutbomber"

    workspaces {
      name = "NIS-AWS-TF-PrefixLists-5017"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.67.0" 
    }
  }
}
