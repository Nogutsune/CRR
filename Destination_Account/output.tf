output "bucket_arn" {
  value = "${aws_s3_bucket.any--unique.arn}"
}