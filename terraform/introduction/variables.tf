variable "aws_region" {
  type        = string
  description = "AWS region to use"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.medium"
}

variable "instance_ami" {
  type        = string
  description = "Instance ami id"
  default     = "ami-09e67e426f25ce0d7"
}

variable "instance_tag_name" {
  type        = string
  description = "Instance tag name"
  default     = "NewEC2Instance"
}
