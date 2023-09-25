variable "security_group_name" {
  description = "Name of the security group"
}

variable "security_group_description" {
  description = "Description of the security group"
}

variable "inbound_port" {
  type        = list(any)
  description = "List of inbound ports to allow"
}

variable "vpc_id" {
  description = "ID of the VPC"
}