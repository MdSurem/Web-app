provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-bkt" {
  bucket = "mdsurem.flm.local"
  provisioner "local-exec" {
    command = "echo bucket-id : ${aws_s3_bucket.my-bkt.id} >> bucket-ids.txt"
  }
}
