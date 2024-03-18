provider "aws" {
  region = "us-east-1"
}

#Run First
#resource "aws_s3_bucket" "myS3Bucket" {
# bucket = "mybuket98314"
#  acl    = "private"
#}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "mybuket98314"
    key    = "terraform/state"
    region = "us-east-1"
  }
}

resource "aws_instance" "myec2" {
  count         = 3
  ami           = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  tags = {
    Name = "MyEc2-${count.index+1}"
  }
}
