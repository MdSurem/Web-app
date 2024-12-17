provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "flm" {
  tags = {
    Name        = "LOL"
    environment = "Dev"
    project     = "swiggy"
  }

  ami               = "ami-0166fe664262f664c"
  instance_type     = "t2.micro"
  key_name          = "suremkey-pair"
  availability_zone = "us-east-1a"
  root_block_device {
    volume_size = 10
  }

  count = 1

}
