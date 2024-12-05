resource "aws_iam_policy" "adarsh" {
  name = "adarsh"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutAnalyticsConfiguration",
        "s3:GetObjectVersionTagging",
        "s3:CreateBucket",
        "s3:ReplicateObject",
        "s3:GetObjectAcl",
        "s3:DeleteBucketWebsite",
        "s3:PutLifecycleConfiguration",
        "s3:GetObjectVersionAcl",
        "s3:DeleteObject",
        "s3:GetBucketPolicyStatus",
        "s3:GetBucketWebsite",
        "s3:PutReplicationConfiguration",
        "s3:GetBucketNotification",
        "s3:PutBucketCORS",
        "s3:GetReplicationConfiguration",
        "s3:ListMultipartUploadParts",
        "s3:GetObject",
        "s3:PutBucketNotification",
        "s3:PutObject",
        "s3:PutBucketLogging",
        "s3:GetAnalyticsConfiguration",
        "s3:GetObjectVersionForReplication",
        "s3:GetLifecycleConfiguration",
        "s3:ListBucketByTags",
        "s3:GetBucketTagging",
        "s3:GetInventoryConfiguration",
        "s3:PutAccelerateConfiguration",
        "s3:DeleteObjectVersion",
        "s3:GetBucketLogging",
        "s3:ListBucketVersions",
        "s3:RestoreObject",
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketPolicy",
        "s3:PutEncryptionConfiguration",
        "s3:GetEncryptionConfiguration",
        "s3:GetObjectVersionTorrent",
        "s3:AbortMultipartUpload",
        "s3:GetBucketRequestPayment",
        "s3:GetObjectTagging",
        "s3:GetMetricsConfiguration",
        "s3:DeleteBucket",
        "s3:PutBucketVersioning",
        "s3:GetBucketPublicAccessBlock",
        "s3:ListBucketMultipartUploads",
        "s3:PutMetricsConfiguration",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:PutInventoryConfiguration",
        "s3:GetObjectTorrent",
        "s3:PutBucketRequestPayment",
        "s3:PutBucketWebsite",
        "s3:GetBucketCORS",
        "s3:GetBucketLocation",
        "s3:GetObjectVersion",
        "s3:ReplicateDelete"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::county-users",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:GetAccountPublicAccessBlock",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  tags = {
    IMPORT1 = "true"
    Name    = "adarsh"
  }

  tags_all = {
    IMPORT1 = "true"
    Name    = "adarsh"
  }
}
