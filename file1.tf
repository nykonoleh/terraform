provider "aws"  {
    access_key = "AKIA6DJE55BK56LAD6XE"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  ami = "ami-0b49a4a6e8e22fa16"
  instance_type = "t3.micro"
}