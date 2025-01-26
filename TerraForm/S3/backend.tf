#statefiles are storing in s3 bucket

terraform {
  backend "s3" {
    bucket = "mdsurem.bucket.flm"
    key    = "backup/terraform.tfstate"
    region = "us-east-1"
  }
}
