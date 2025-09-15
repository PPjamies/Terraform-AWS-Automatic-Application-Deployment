resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "route-table-association" {
  route_table_id = aws_route_table.route-table.id
  subnet_id      = aws_subnet.web-subnet.id
}
