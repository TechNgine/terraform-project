output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = [for instance in aws_instance.terraform-ec2 : instance.public_ip]
}

