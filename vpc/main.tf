provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "your-bucket"
    key    = "state/infrastructure/tfstate"
    region = "eu-west-2"
  }
}