output "vpc" {
  value = aws_vpc.dev.id
}

output "subnet" {
  value = aws_subnet.dev.*.id
}

output "gw" {
  value = aws_internet_gateway.dev.id
}

output "alb" {
  value = aws_alb.dev.id
}

output "alb-listener" {
  value = aws_alb_listener.alb-dev.id
}