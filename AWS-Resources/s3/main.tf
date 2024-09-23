provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-state-latest"
    key = "s3/s3.tfstate"
    region = "us-east-1"
  }
}

module "s3" {

  source = "../../modules/s3"
  s3_buckets = var.s3_buckets
}