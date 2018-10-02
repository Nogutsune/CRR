

resource "aws_s3_bucket" "any--unique--bucket" {
  provider = "aws.source"
  bucket = "${var.AWS_Bucket}"
  versioning {
    enabled = true
  }
  
  replication_configuration {
    role = "${aws_iam_role.replication.arn}"

    rules {
      id     = "id"
      prefix = ""
      status = "Enabled"

      destination {
        bucket  = "arn:aws:s3:::${var.AWS_Destination_Bucket}"

      }
	}
  }
 	
}




resource "aws_s3_bucket" "any--unique" {
  provider = "aws.destination"
  bucket = "${var.AWS_Destination_Bucket}"
  versioning {
    enabled = true
  }


}

resource "aws_s3_bucket_policy" "any--unique--bucket" {
  provider = "aws.destination"
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
                "AWS": "arn:aws:iam::${var.AWS_Source_Account_ID}:root"
            },
            "Action": [
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning",
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ObjectOwnerOverrideToBucketOwner"
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


