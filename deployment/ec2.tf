data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "web_key" {
  key_name   = var.ssh_key_name
  public_key = file(var.ssh_public_key_path)
}

resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.web_key.key_name
  subnet_id              = aws_subnet.web-subnet.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  # terraform connects to instance using private key
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.ssh_private_key_path)
    host        = self.public_ip
  }

  # copy app to instance
  provisioner "file" {
    source      = "../flask-application.zip"
    destination = "/home/ubuntu/flask-application.zip"
  }

  # run set up command remotely
  provisioner "remote-exec" {
    inline = [
      # proof ssh works
      "echo 'Hello from the remote instance'",

      # install dependencies
      "sudo apt update -y",
      "sudo apt install -y python3-pip unzip",
      "sudo pip3 install flask",

      # unzip flask app
      "unzip /home/ubuntu/flask-application.zip -d /home/ubuntu/flask-application",
      "sudo python3 /home/ubuntu/flask-application/app.py"
    ]
  }
}
