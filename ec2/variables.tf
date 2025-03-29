variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "us-east-1" 
}

variable "key_name" { 
    description = "SSH keys to connect to ec2 instance" 
    default     =  "springclasskey"
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.medium" 
}

variable "security_group" { 
    description = "Name of security group" 
    default     = "${APPLICATION}" 
}

variable "ami_id" { 
    description = "AMI for Ubuntu Ec2 instance" 
    default     = "ami-0e1bed4f06a3b463d" 
}

variable "environment" {
    description = "Environment name (dev, qa, or prod)"
    type        = string
    validation {
        condition     = contains(["dev", "qa", "prod"], var.environment)
        error_message = "Environment must be one of: dev, qa, prod"
    }
}

variable "application" {
    description = "Application type (java, python, or net)"
    type        = string
    validation {
        condition     = contains(["java", "python", "net"], var.application)
        error_message = "Application must be one of: java, python, net"
    }
}

variable "instance_count" {
    description = "Number of instances to create"
    type        = number
    validation {
        condition     = var.instance_count >= 1
        error_message = "Instance count must be at least 1"
    }
}
