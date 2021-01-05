variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "subnets_cidr" {
	type = list
	default = ["192.168.1.0/24", "192.168.2.0/24"]
}

variable "azs" {
	type = list
	default = ["eu-west-2a", "eu-west-2b"]
}

variable "cert" {
  type = string
  default = "arn:aws:acm:eu-west-2:368211546133:certificate/6bfeffcf-b6e4-4169-a5d6-7d5d78805123"
}

variable "host" {
  type = string
  default = "myservice.com"
}

variable "environment" {
  type = string
  default = "dev"
}