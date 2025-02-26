#######################################
#              VPC                    #
#######################################
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

#######################################
#              EC2                    #
#######################################
variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.large"
}

variable "ec2_ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0a313d6098716f372"
}
