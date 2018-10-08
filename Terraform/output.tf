output "iam_source_arn" {
  value = "${aws_iam_role.replication.arn}"
}

output "destination_bucket_arn" {
  value = "${aws_s3_bucket.any--unique.arn}"

}