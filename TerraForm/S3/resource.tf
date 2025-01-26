resource "aws_s3_bucket" "my-s3" {
  bucket = "mysurem.bucket.flm"
}

resource "aws_s3_bucket_versioning" "my-version" {
  bucket = aws_s3_bucket.my-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}


--------------------------------------------------------------
#security-group code

resource "aws_security_group" "my-sg" {
  name        = "terraform-sg"
  description = "its all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                     # all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
