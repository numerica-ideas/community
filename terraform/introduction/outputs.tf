output "instance_arn" {
  description = "Created ec2 arn"
  value       = aws_instance.new_instance.arn
}

output "instance_public_ip" {
  description = "Instance public ip"
  value       = aws_instance.new_instance.public_ip
}

output "instance_public_dns" {
  description = "Instance public dns"
  value       = aws_instance.new_instance.public_dns
}
