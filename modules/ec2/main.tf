# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[0] # Use the first public subnet
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "${var.environment}-web-instance"
  }
}
