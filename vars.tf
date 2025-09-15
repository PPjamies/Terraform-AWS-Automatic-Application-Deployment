variable "ssh_cidr_blocks" {
  type        = set(string)
  description = "CIDR blocks allowed to SSH"
  default     = []
}
