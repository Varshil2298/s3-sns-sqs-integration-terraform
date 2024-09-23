provider "aws" {
  region = "us-east-1"
}
 
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-latest"
    key = "sqs-new/sqs.tfstate"
    region = "us-east-1"
  }
}

module "sqs_queue" {
  source = "../../modules/sqs"
  sqs_queues = var.sqs_queues
  region = var.region
  account_id = var.account_id
}