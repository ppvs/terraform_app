variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "subnets_cidr" {
	type = "list"
	default = ["192.168.1.0/24", "192.168.2.0/24"]
}

variable "azs" {
	type = "list"
	default = ["eu-west-2a", "eu-west-2b"]
}