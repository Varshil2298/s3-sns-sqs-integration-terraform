provider "aws" {
  region = "us-east-1"
}
 
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-latest"
    key = "sns-new/sns.tfstate"
    region = "us-east-1"
  }
}


module "sns_topic" {
  source = "../../modules/sns"
  sns_topics = var.sns_topics
  region = var.region
  account_id = var.account_id
}
 