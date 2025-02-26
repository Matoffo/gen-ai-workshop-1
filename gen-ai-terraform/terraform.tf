provider "aws" {
  region = local.region
}

terraform {
  required_version = ">=1.5.1"
  backend "s3" {
    bucket = "wshop-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
