provider "aws" {
  region = "us-east-1"
  
}

resource "aws_iam_role" "replication" {
  name = "tf-iam-role-replication-12349995"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}
