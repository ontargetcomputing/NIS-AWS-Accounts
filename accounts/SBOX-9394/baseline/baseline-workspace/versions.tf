terraform {
  required_version = ">= 1.9.8"

  cloud {
    organization = "balutbomber"

    workspaces {
      name = "NIS-AWS-Accounts-SBOX-9394-baseline-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.67.0"  
    }
  }
}
