variable "name" {
  type        = string
  default     = "dev_app"
}

variable "autoscaling" {
  default = {
    desired_capacity = "3"
    max_size         = "3"
    min_size         = "3"
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