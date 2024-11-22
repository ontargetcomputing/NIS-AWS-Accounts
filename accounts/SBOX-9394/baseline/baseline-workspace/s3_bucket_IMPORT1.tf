data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket" "cargotank" {
  bucket        = "cargotank"
  force_destroy = "false"


  object_lock_enabled = "false"

  tags = {
    IMPORT1 = "true"
    Name    = "cargotank"
  }

  tags_all = {
    IMPORT1 = "true"
    Name    = "cargotank"
  }
}

resource "aws_s3_bucket_versioning" "cargotank_versioning" {
  bucket = aws_s3_bucket.cargotank.id
  versioning_configuration {
    status = "Enabled"
    mfa_delete = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "cargotank_bucket_acl" {
  bucket = aws_s3_bucket.cargotank.id
  access_control_policy {
    grant {
      grantee {
        id   = "b3b23dd60e4ea2a601e68fae3b61071102e13dc3ed0c1d6455fe0b715239a9e5"
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cargotank_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.cargotank.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled = "true"
  }
}

resource "aws_s3_bucket_request_payment_configuration" "cargotank_request_payment_configuration" {
  bucket = aws_s3_bucket.cargotank.bucket
  payer  = "BucketOwner"
}
