resource "aws_autoscaling_group" "app" {
  name                      = var.name
  max_size                  = var.autoscaling["max_size"]
  min_size                  = var.autoscaling["min_size"]
  desired_capacity          = var.autoscaling["desired_capacity"]
  force_delete              = true
  launch_configuration      = aws_launch_configuration.app.name
  termination_policies      = ["OldestLaunchConfiguration"]
  vpc_zone_identifier       = var.subnets
  target_group_arns         = [aws_alb_target_group.app.id]

  tags = concat( [
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "Application"
      value               = var.name
      propagate_at_launch = true
    }
  ])
}

resource "aws_launch_configuration" "app" {
  name_prefix   = var.name
  image_id      = data.aws_ami.ubuntu.id
  key_name      = "kreoprod"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.app.id]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo mkdir -p ${var.name}
              echo "Hello Karma" > ${var.name}/index.html
              sudo nohup busybox httpd -f -p 80 &
              EOF
}

resource "aws_security_group" "app" {
  vpc_id      = var.vpc
  name        = var.name

  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Application = var.name
  }
}