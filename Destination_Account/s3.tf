resource "aws_s3_bucket" "any--unique" {
  bucket = "${var.AWS_Bucket}"
  versioning {
    enabled = true
  }


}

resource "aws_s3_bucket_policy" "any--unique--bucket" {
  bucket = "${aws_s3_bucket.any--unique.id}"
  policy =<<POLICY
{
    "Version": "2008-10-17",
    "Id": "S3-Console-Replication-Policy",
    "Statement": [
        {
            "Sid": "S3ReplicationPolicyStmt1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.AWS_Source_ARN}"
            },
            "Action": [
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning",
                "s3:ReplicateObject",
                "s3:ReplicateDelete"
            ],
            "Resource": [
                "${aws_s3_bucket.any--unique.arn}",
                "${aws_s3_bucket.any--unique.arn}/*"
            ]
        }
    ]
}
POLICY
}