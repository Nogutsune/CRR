

resource "aws_s3_bucket" "any--unique--bucket" {
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
        bucket        = "arn:aws:s3:::qubecinemas-destination-bucket-crr"
        storage_class = "STANDARD"
      }
	}
}	
}

