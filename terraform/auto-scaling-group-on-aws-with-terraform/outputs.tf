output "application_endpoint" {
  value = aws_lb.alb.dns_name
}
