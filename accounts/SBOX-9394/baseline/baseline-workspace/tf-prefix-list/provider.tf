provider "aws" {
  region = var.AWS_REGION

  default_tags {
    tags = {
      "DHCS:Environment" = var.env
      "DCHS:SourceControl" = var.SourceControl
    }
  }
}