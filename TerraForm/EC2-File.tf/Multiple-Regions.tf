provider "aws" {
  region = "us-east-1"
}


provider "aws" {
  region = "ap-south-1"
  alias  = "surem"
}

# resource.tf

resource "aws_instance" "one" {
  tags = {
    Name = "my-${terraform.workspace}-server"
  }
  ami           = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
}

resource "aws_instance" "two" {
  provider      = "aws.surem"
  tags = {
    Name = "my-${terraform.workspace}-server"
  }
  ami           = "ami-id"
  instance_type = "t2.micro"
}

# to see output

output "abc" {
  value = [aws_instance.one.public_ip, 
           aws_instance.one.private_ip, 
           aws_instance.one.id
         ]
}
