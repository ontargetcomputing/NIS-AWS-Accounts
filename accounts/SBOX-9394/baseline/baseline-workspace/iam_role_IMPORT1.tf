resource "aws_iam_role" "balutbomber-terraform-admin-role" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {},
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::582983609964:root"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "balutbomber-terraform-admin-role"
  path                 = "/"

  tags = {
    IMPORT1 = "true"
    Name    = "balutbomber-terraform-admin-role"
  }

  tags_all = {
    IMPORT1 = "true"
    Name    = "balutbomber-terraform-admin-role"
  }
}
