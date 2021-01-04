resource "aws_alb" "dev" {
  name            = "alb-dev"
  subnets         = aws_subnet.dev.*.id
  security_groups = [aws_security_group.alb-dev.id]
}

resource "aws_security_group" "alb-dev" {

  vpc_id = aws_vpc.dev.id
  name   = "alb-dev"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_alb_listener" "alb-dev" {
  load_balancer_arn = aws_alb.dev.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}