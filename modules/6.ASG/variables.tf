#-----------------------------------------Lunch Template-----------------------------------------------------#
variable "lt_name" {
  type = string
}

variable "lt_ami_img" {
  type = string
}

variable "lt_instance_type" {
  type = string
}

#-----------------------------------------------ASG-----------------------------------------------------#
variable "asg_name" {
  type = string
}

variable "asg_availability_zones" {
  type = list(string)
}

variable "asg_desired_capacity" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "asg_min_size" {
  type = number
}

variable "asg_vpc_zone_identifier" {
  type = list(string)
}

variable "asg_health_check_type" {
  type = string
}

variable "asg_termination_policies" {
  type = list(string)
}

variable "default_cooldown" {
  type = number
}

variable "target_group_arns" {
  type = list(string)
}

#-----------------------------------------------ASG Policy-----------------------------------------------------#
variable "asg_policy_name" {
  type = string
}

variable "asg_policy_type" {
  type = string
}

variable "asg_policy_target_value" {
  type = number
}

variable "asg_policy_predefined_metric_type" {
  type = string
}