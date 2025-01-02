# Variables for VPC module
variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet" {
  type = list(string)
}
