provider "aws" {
  region = "us-east-1"
  access_key = "AKIAILXHKGRVNNF6XUSQ"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
