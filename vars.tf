variable "ssh_cidr_blocks" {
  type        = set(string)
  description = "CIDR blocks allowed to SSH"
  default     = []
}

variable "ssh_key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the public key to use for EC2 instance"
}
