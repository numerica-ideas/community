variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "VPC name tag"
}

variable "igw_name" {
  description = "Internet Gateway name"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "public_subnet_name_prefix" {
  description = "Prefix for naming public subnets"
}

variable "private_subnet_name_prefix" {
  description = "Prefix for naming private subnets"
}

variable "public_rt_name" {
  description = "Name for the public route table"
}

variable "private_rt_name" {
  description = "Name for the private route table"
}
