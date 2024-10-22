provider "aws" {
  region = "us-west-2"

  # default_tags {
  #   tags = {
  #     "DHCS:SourceControl" = "${var.GIT_REPO_URL}:${var.GIT_COMMIT_HASH}"
  #     "DHCS:Environment" = var.ENVIRONMENT
  #   }
  # }
}