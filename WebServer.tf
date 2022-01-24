#--------------------------------------------------
# My Terraform
#
# Build WebServer during bootstrap
#
# Made by Oleh Nykon

provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "my_webserver" {
    ami= "ami-02d03ce209db75523" 
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security group"
  description = "Security group for server"


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


}