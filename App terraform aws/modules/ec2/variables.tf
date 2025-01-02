# Variables for EC2 module
variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "security_group" {
  type = string
}
