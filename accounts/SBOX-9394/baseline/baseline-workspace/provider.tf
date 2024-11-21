provider "aws" {
  region = var.AWS_REGION

  assume_role {
    role_arn = "arn:aws:iam::582983609964:role/balutbomber-terraform-admin-role"
    session_name = "tfc"
  }

  # default_tags {
  #   tags = {
  #     "DHCS:SourceControl" = "${var.GIT_REPO_URL}:${var.GIT_COMMIT_HASH}"
  #     "DHCS:Environment" = var.ENVIRONMENT
  #   }
  # }
}