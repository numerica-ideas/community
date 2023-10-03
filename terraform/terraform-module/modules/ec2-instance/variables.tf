variable "instance_name" {
  description = "Name of the EC2 instance launched with this configuration"
}

variable "aws_subnet_id" {
  description = "ID of the AWS subnet in which to launch the EC2 instance"
}

variable "ami" {
  description = "ID of the Amazon Machine Image (AMI) to use for the EC2 instance"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for connecting to the EC2 instance"
}

variable "instance_type" {
  description = "Type of EC2 instance to launch (e.g., t2.micro, m5.large, etc.)"
}

variable "ebs_volume_size" {
  description = "Size (in GB) of the EBS volume to attach to the EC2 instance"
}

variable "ec2_sg_id" {
  description = "ID of the EC2 Security Group(s) to associate with the EC2 instance"
}