resource "aws_efs_file_system" "efs_volume" {
  creation_token = "efs_volume"
}

resource "aws_efs_mount_target" "efs_mount_target_1" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = aws_subnet.ec2_1_public_subnet.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_mount_target" "efs_mount_target_2" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = aws_subnet.ec2_2_public_subnet.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_mount_target" "efs_mount_target_3" {
  file_system_id  = aws_efs_file_system.efs_volume.id
  subnet_id       = aws_subnet.ec2_3_public_subnet.id
  security_groups = [aws_security_group.efs_sg.id]
}
