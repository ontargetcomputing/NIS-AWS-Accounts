resource "aws_s3_bucket" "cargotank" {
  bucket        = "cargotank"
  force_destroy = "false"

  grant {
    id          = "b3b23dd60e4ea2a601e68fae3b61071102e13dc3ed0c1d6455fe0b715239a9e5"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  tags = {
    IMPORT1 = "true"
    Name    = "cargotank"
  }

  tags_all = {
    IMPORT1 = "true"
    Name    = "cargotank"
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
