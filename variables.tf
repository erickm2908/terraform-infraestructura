# Declare variables for environment-specific configurations

variable "environment" {
  description = "The environment to deploy (dev or prod)"
  type        = string
}

variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "instance_type" {
  description = "Type of EC2 instance to deploy"
  type        = string
}
