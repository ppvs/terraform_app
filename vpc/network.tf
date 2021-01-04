resource "aws_vpc" "dev" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-dev"
  }
}

resource "aws_subnet" "dev" {
  count = "${length(var.subnets_cidr)}"
  vpc_id     = aws_vpc.dev.id
  cidr_block = "${var.subnets_cidr[count.index]}"
  availability_zone = "${var.azs[count.index]}"
  tags = {
    Name = "subnet-app"
  }
  depends_on = [aws_internet_gateway.dev]
}

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }

  tags = {
    Env = "dev"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.dev.id
  route_table_id = aws_route_table.dev.id
}