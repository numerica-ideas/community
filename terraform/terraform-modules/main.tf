data "aws_vpc" "myvpc" {
  id = "vpc-xxxxxx"
}

data "aws_subnet" "mysubnet" {
  id = "subnet-xxxxxx"
}

module "security_group_ec2" {
  source                     = "./modules/security-group"
  security_group_name        = "myec2-sg"
  security_group_description = "EC2 security Group"
  inbound_port               = [8080, 22]
  vpc_id                     = data.aws_vpc.myvpc.id
}

module "myinstance" {
  source                    = "./modules/ec2-instance"
  aws_subnet_id             = data.aws_subnet.mysubnet.id
  instance_name             = "EC2"
  ami                       = "ami-08766f81ab52792ce"
  key_name                  = "mykey"
  instance_type             = "t3.micro"
  ebs_volume_size           = 30
  ec2_sg_id                 = [module.security_group_ec2.security_group_id]

}