# Outputs for the EC2 module
output "public_ip" {
  value = aws_instance.web.public_ip
}
