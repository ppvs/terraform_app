provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate"
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