variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "us-east-1" 
}

variable "key_name" { 
    description = " SSH keys to connect to ec2 instance" 
    default     =  "SpringClassKey"
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.medium" 
}

variable "security_group" { 
    description = "Name of security group" 
    default     = "new-terraform-sg" 
}

variable "tag_name" { 
    description = "Tag Name of for Ec2 instance" 
    default     = "terraform-ec2" 
} 
variable "ami_id" { 
    description = "AMI for Ubuntu Ec2 instance" 
    default     = "ami-04b4f1a9cf54c11d0" 
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_name" {
  description = "Unique name for each instance"
  type        = string
}
