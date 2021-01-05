provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "backup-test-env"
    key    = "state/infrastructure/tfstate"
    region = "eu-west-2"
  }
}