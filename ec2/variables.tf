variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "us-east-1" 
}

variable "key_name" { 
    description = " SSH keys to connect to ec2 instance" 
    default     =  "springclasskey"
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
<<<<<<< HEAD
    description = "AMI for Ubuntu Ec2 instance" 
    default     = "ami-0e1bed4f06a3b463d" 
=======
    description = "AMI for Ec2 instance" 
    default     = "ami-0893df1bd754c3189" 
>>>>>>> dennis-branch
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}
