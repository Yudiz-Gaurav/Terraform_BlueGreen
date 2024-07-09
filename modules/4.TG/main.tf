# Create Target Group
resource "aws_lb_target_group" "my_tg" { 
 name     = var.tg_name
 port     = var.tg_port
 protocol = var.tg_protocol
 vpc_id   = var.vpc_id
 target_type = var.target_type
 
 health_check {
    healthy_threshold   = var.health_check["healthy_threshold"]
    interval            = var.health_check["interval"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    timeout             = var.health_check["timeout"]
    path                = var.health_check["path"]
    port                = var.health_check["port"]
 }
}

// Target group attachment
resource "aws_lb_target_group_attachment" "tg_attachment" {
 target_group_arn = aws_lb_target_group.my_tg.arn
 target_id        = var.tg_id
 port             = var.tg_attachment_port
}