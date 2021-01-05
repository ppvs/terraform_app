variable "name" {
  type        = string
  default     = "dev_app"
}

variable "environment" {
  type        = string
  default     = "dev"
}

variable "autoscaling" {
  default = {
    desired_capacity = "1"
    max_size         = "3"
    min_size         = "1"
  }
}

variable "vpc" {
  type        = string
  default     = "vpc"
}

variable "subnets" {
  type        = list(string)
  default     = ["subnet-1", "subnet-2"]
}

variable "alb" {
  type        = string
  default     = ""
}

variable "alb-listener" {
  type        = string
  default     = ""
}