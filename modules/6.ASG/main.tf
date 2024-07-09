#Lunch Template
resource "aws_launch_template" "asg_lt" {
  name_prefix   = var.lt_name
  image_id      = var.lt_ami_img
  instance_type = var.lt_instance_type
}

#Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name = var.asg_name 
  # availability_zones = var.asg_availability_zones
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  vpc_zone_identifier = var.asg_vpc_zone_identifier       
  health_check_type     = var.asg_health_check_type
  termination_policies  = var.asg_termination_policies
  # Amount of time, in seconds, after a scaling activity completes before another scaling activity can start
  default_cooldown = var.default_cooldown
  #Add TG in ASG
  target_group_arns = var.target_group_arns

  launch_template {
    id      = aws_launch_template.asg_lt.id
    version = "$Latest"
  }

  depends_on = [ aws_launch_template.asg_lt ]
}

#ASG Policy
resource "aws_autoscaling_policy" "example" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  name                   = var.asg_name
  policy_type            = var.asg_policy_type
  target_tracking_configuration {
    target_value = var.asg_policy_target_value
    predefined_metric_specification {
      predefined_metric_type = var.asg_policy_predefined_metric_type
    }
  }

  depends_on = [ aws_autoscaling_group.asg ]
}