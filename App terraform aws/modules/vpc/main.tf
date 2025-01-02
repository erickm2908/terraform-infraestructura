# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

# Create public subnets
resource "aws_subnet" "public" {
  count      = length(var.public_subnet) # Create a subnet for each CIDR block
  cidr_block = var.public_subnet[count.index]
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-subnet-${count.index}"
  }
}
