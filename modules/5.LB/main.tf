// ALB
resource "aws_lb" "my_alb" {
 name               = var.lb_name
 internal           = false
 load_balancer_type = var.load_balancer_type
 security_groups    = var.sg_id
 subnets            = var.subnets_id
}

// Listener
resource "aws_lb_listener" "my_alb_listener" {
 load_balancer_arn = aws_lb.my_alb.arn
 port              = var.aws_lb_listener_port
 protocol          = var.aws_lb_listener_protocol

 default_action {
   type             = var.aws_lb_listener_action_type
   target_group_arn = var.target_group_arn
 }
}
