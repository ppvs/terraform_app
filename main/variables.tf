variable "aws_region" {
  type        = string
  default     = "eu-west-2"
}

variable "projects" {
  type        = map
  default     = {
    app1 = {
      environment  = "dev1"
    }
  }
}