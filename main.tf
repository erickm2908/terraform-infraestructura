# Configure Terraform backend to store state remotely in S3
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "env/${var.environment}/terraform.tfstate" # Environment-specific state file
    region         = "us-east-1"
    dynamodb_table = "terraform-locks" # For state locking
    encrypt        = true
  }
}

# Configure AWS provider
provider "aws" {
  region = var.region
}

# Call the VPC module
module "vpc" {
  source        = "./modules/vpc"       # Path to the VPC module
  environment   = var.environment       # Pass environment variable
  vpc_cidr      = var.vpc_cidr          # Pass CIDR block for VPC
  public_subnet = var.public_subnet     # Pass public subnet CIDRs
}

# Call the Security module
module "security" {
  source      = "./modules/security"    # Path to the Security module
  environment = var.environment         # Pass environment variable
  vpc_id      = module.vpc.vpc_id       # Use VPC ID from the VPC module
}

# Call the EC2 module
module "ec2" {
  source         = "./modules/ec2"      # Path to the EC2 module
  environment    = var.environment      # Pass environment variable
  instance_type  = var.instance_type    # Pass EC2 instance type
  public_subnets = module.vpc.public_subnets # Pass public subnets from VPC module
  security_group = module.security.security_group_id # Pass Security Group ID
}
