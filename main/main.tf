provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "your-bucket"
    key    = "state/app/tfstate"
    region = "eu-west-2"
  }
}

data "terraform_remote_state" "vpc" {
  // backend = "local"

  // config = {
  //   path = "../vpc/terraform.tfstate"
  // }

  backend = "s3"
  config = {
    bucket = "your-bucket"
    key    = "state/infrastructure/tfstate"
    region = "eu-west-2"
  }
}

module "project" {
    source = "../app/"
    
    for_each = var.projects

    name = each.key
    vpc = data.terraform_remote_state.vpc.outputs.vpc
    subnets = data.terraform_remote_state.vpc.outputs.subnet
    alb = data.terraform_remote_state.vpc.outputs.alb
    alb-listener = data.terraform_remote_state.vpc.outputs.alb-listener
}