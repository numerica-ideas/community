#Create a security 
resource "aws_security_group" "security" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  # dynamic block who create two rules to allow inbound traffic 
  dynamic "ingress" {
    for_each = var.inbound_port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
