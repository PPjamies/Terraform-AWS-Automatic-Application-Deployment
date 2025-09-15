variable "provider_region" {
  type        = string
  description = "AWS provider region"
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.1.0/24"
}

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
