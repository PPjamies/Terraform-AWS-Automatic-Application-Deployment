resource "aws_vpc" "web-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "web-subnet" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}
