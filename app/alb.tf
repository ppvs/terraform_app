resource "aws_alb_listener_rule" "app" {
  listener_arn = var.alb-listener

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app.arn
  }

  condition {
    path_pattern {
      values = ["/${var.name}*"]
    }
  }
}

resource "aws_alb_target_group" "app" {
//   name     = var.name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc
    health_check {
    interval = 5
    timeout  = 2
  }
  tags = {
    Environment = var.environment
    Application = var.name
  }
}