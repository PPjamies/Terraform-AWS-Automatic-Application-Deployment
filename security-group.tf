resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH inbound traffic and all outbound traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "10.0.0.0/8"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}
