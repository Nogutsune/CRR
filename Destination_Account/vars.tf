variable "access_key" {}
variable "secret_key" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}


variable "AWS_Bucket" {
  default = "any--unique--bucket--destination123"
}

variable "AWS_Source_ARN"{
   default = "arn:aws:iam::028497140120:root"
}