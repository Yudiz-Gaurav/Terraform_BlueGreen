# ==============================================================================
#                            ✨ For Provider ✨
# ==============================================================================

variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

# ==============================================================================
#                               ✨ For VPC ✨
# ==============================================================================

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR Block fo Public Subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR Block fo Private Subnet"
  type        = list(string)
}

variable "public_rt_destination_cidr_block" {
  description = "Public RT Destination Route"
  type        = string
}

variable "private_rt_destination_cidr_block" {
  description = "Privat blic RT Destination Route"
  type        = string
}

variable "vpc_security_group_name" {
  description = "Name for the security group"
  type        = string
}

variable "vpc_security_group_description" {
  description = "Description for the security group"
  type        = string
}

variable "vpc_security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for security group ingress rules"
  type        = list(string)
}

# ==============================================================================
#                            ✨ For IAM Policy ✨
# ==============================================================================

variable "EC2CodeDeployRole" {
  type = string
}

variable "EC2CodeDeployPolicy" {
  type = string
}

variable "CodeDeployRole" {
  type = string
}

variable "CodeDeployPolicy" {
  type = string
}



# ==============================================================================
#                            ✨ For EC2 ✨
# ==============================================================================

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  type = string
}

variable "volume_size" {
  description = "EC2 Volume Size"
  type        = number
}

variable "volume_type" {
  description = "EC2 Volume Type"
  type        = string
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
}

variable "ami_name" {
  description = "Name of AMI"
  type        = string
}



# ==============================================================================
#                            ✨ For TG ✨
# ==============================================================================

variable "tg_name" {
  description = "Name of Target Group"
  type        = string
}

variable "tg_port" {
  description = "Send trffic to this port"
  type        = number
}

variable "tg_protocol" {
  description = "Protocol for Target Group"
  type        = string
}

variable "tg_attachment_port" {
  description = "Port of Target Group Attachment"
  type        = number
}

variable "target_type" {
  description = "Target Type"
  type        = string
}

variable "health_check" {
  type = map(string)
}


# ==============================================================================
#                            ✨ For LB ✨
# ==============================================================================

variable "lb_name" {
  description = "Load Balanacer Name"
  type        = string
}

variable "load_balancer_type" {
  description = "Type of LB"
  type        = string
}

variable "aws_lb_listener_port" {
  description = "Port of LB listener"
  type        = number
}

variable "aws_lb_listener_protocol" {
  description = "Protocol of LB listener"
  type        = string
}

variable "aws_lb_listener_action_type" {
  description = "Action for LB listener"
  type        = string
}

# ==============================================================================
#                            ✨ For ASG ✨
# ==============================================================================

variable "lt_name" {
  type = string
}

variable "lt_instance_type" {
  type = string
}
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

variable "asg_health_check_type" {
  type = string
}

variable "asg_termination_policies" {
  type = list(string)
}

variable "default_cooldown" {
  type = number
}

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

# ==============================================================================
#                            ✨ For BlueGreenPipeline ✨
# ==============================================================================

variable "ApplicationName" {
  type = string
}

variable "DeploymentGroupName" {
  type = string
}

# variable "CodeDeployARN" {
#   type = string
# }

# variable "targetgroup" {
#   type = string
# }