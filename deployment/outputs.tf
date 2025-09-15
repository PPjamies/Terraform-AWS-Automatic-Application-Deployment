output "web-link" {
  value = "http://${aws_instance.web-server.public_ip}"
}
