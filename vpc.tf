resource "aws_vpc" "web-vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "web-subnet" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
}
