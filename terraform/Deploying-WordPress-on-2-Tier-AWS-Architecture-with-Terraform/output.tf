output "public_1_ip" {
  value = aws_instance.production_1_instance.public_ip
}

output "public_2_ip" {
  value = aws_instance.production_2_instance.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.rds_master.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds_master.username
}


output "rds_name" {
  value = aws_db_instance.rds_master.db_name
}

# print the DNS of load balancer
output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.application_loadbalancer.dns_name
}
