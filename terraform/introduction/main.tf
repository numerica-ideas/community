provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "new_instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data = <<-EOF
        #!/bin/bash
        apt update
        apt install -y nginx
        sudo service nginx start
        EOF

  tags = {
    "Name" = var.instance_tag_name
  }
}

resource "aws_security_group" "instance_sg" {
  name = "instance-sg"

  ingress {
    description = "instance ingress security group"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
