variable "aws_region" {
    description = "The AWS region to create things in." 
    type        = string
    default     = "us-east-1"
}

variable "key_name" { 
    description = "SSH key name to connect to EC2 instance" 
    type        = string
    default     = "jenkins-key"
}

variable "instance_type" { 
    description = "Instance type for EC2" 
    type        = string
    default     = "t2.medium"
}

variable "security_group" { 
    description = "Name of the security group" 
    type        = string
    default     = "new-terraform-sg"
}

variable "tag_name" { 
    description = "Tag name for the EC2 instance" 
    type        = string
}

variable "ami_id" { 
    description = "AMI for Ubuntu EC2 instance" 
    type        = string
    default     = "ami-0e1bed4f06a3b463d"
}

variable "instance_count" { 
    description = "Number of EC2 instances to create" 
    type        = number
    default     = 5
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "172.31.0.0/16"
}

variable "allowed_ips" {
    description = "List of allowed IPs for RDP access"
    type        = list(string)
    default     = ["0.0.0.0/0"]  # Change this to your real IP for security
}

