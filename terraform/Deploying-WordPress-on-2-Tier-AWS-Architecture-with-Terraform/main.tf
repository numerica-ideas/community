resource "aws_instance" "production_1_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.ec2_1_public_subnet.id
  vpc_security_group_ids = [aws_security_group.production-instance-sg.id]
  key_name               = var.key_name
  user_data              = file("install_script.sh")
  tags = {
    Name = "Production instance 1"
  }
  depends_on = [
    aws_db_instance.rds_master,
  ]
}

resource "aws_instance" "production_2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.ec2_2_public_subnet.id
  vpc_security_group_ids = [aws_security_group.production-instance-sg.id]
  key_name               = var.key_name
  user_data              = file("install_script.sh")
  tags = {
    Name = "Production instance 2"
  }
  depends_on = [
    aws_db_instance.rds_master,
  ]
}

resource "aws_db_subnet_group" "database_subnet" {
  name       = "db subnet"
  subnet_ids = [aws_subnet.database_private_subnet.id, aws_subnet.database_read_replica_private_subnet.id]
}

data "aws_kms_key" "by_id" {
  key_id = "2de55688-7b1f-4830-85aa-385fecca2b1f" # KMS key associated with the CEV
}

resource "aws_db_instance" "rds_master" {
  identifier              = "master-rds-instance"
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7.37"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  kms_key_id              = data.aws_kms_key.by_id.arn
  backup_retention_period = 7
  multi_az                = false
  availability_zone       = var.availability_zone[2]
  db_subnet_group_name    = aws_db_subnet_group.database_subnet.id
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.database-sg.id]
  storage_encrypted       = true

  tags = {
    Name = "my-rds-master"
  }
}

resource "aws_db_instance" "rds_replica" {

  replicate_source_db    = aws_db_instance.rds_master.identifier
  instance_class         = "db.t3.micro"
  identifier             = "replica-rds-instance"
  allocated_storage      = 10
  skip_final_snapshot    = true
  multi_az               = false
  availability_zone      = var.availability_zone[1]
  vpc_security_group_ids = [aws_security_group.database-sg.id]
  storage_encrypted      = true

  tags = {
    Name = "my-rds-replica"
  }

}

