provider "aws" { 
    region = "us-east-1"
	profile = "source"
	alias = "source"	
}

provider "aws" {
    region = "eu-west-1"
	profile = "destination"
	alias = "destination"
}

