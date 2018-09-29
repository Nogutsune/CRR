provider "aws" {
  region = "us-east-1"
  access_key = 
  secret_key = 
}

resource "aws_instance" "web" {
  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
