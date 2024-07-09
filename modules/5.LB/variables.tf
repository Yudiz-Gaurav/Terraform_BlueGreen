#--------------------------------------For LB-----------------------------------------#
variable "lb_name" {
  description = "Load Balanacer Name"
  type = string
}

variable "load_balancer_type" {
  description = "Type of LB"
  type = string
}

variable "sg_id" {
  description = "SG ID"
  type = list(string)
}

variable "subnets_id" {
  description = "Subnet's id"
  type = list(string)
}

#--------------------------------------For LB Listener-----------------------------------------#
variable "aws_lb_listener_port" {
  description = "Port of LB listener"
  type = number
}

variable "aws_lb_listener_protocol" {
  description = "Protocol of LB listener"
  type = string
}

variable "aws_lb_listener_action_type" {
  description = "Action for LB listener"
  type = string
}

variable "target_group_arn" {
  description = "TG ARN"
  type = string
}