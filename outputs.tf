# Output the ID of the VPC
output "vpc_id" {
  description = "The ID of the VPC created"
  value       = module.vpc.vpc_id
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.public_ip
}
