# Creation of application LoadBalancer
resource "aws_lb" "application_loadbalancer" {
  name               = "application-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.production-instance-sg.id]
  subnets            = [aws_subnet.ec2_2_public_subnet.id, aws_subnet.ec2_1_public_subnet.id]
}

# Target group for application loadbalancer
resource "aws_lb_target_group" "target_group_alb" {
  name     = "target-group-alb"
  port     = var.target_application_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.infrastructure_vpc.id
}

# attach target group to an instance
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target_group_alb.arn
  target_id        = aws_instance.production_1_instance.id
  port             = var.target_application_port
  depends_on = [
    aws_instance.production_1_instance,
  ]
}

# attach target group to an instance
resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_group_alb.arn
  target_id        = aws_instance.production_2_instance.id
  port             = var.target_application_port
  depends_on = [
    aws_instance.production_2_instance,
  ]
}

# attach target group to a loadbalancer
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = var.target_application_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_alb.arn
  }
}


