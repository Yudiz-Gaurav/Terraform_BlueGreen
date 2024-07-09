# ==============================================================================
#                            ✨ Provider Variables ✨
# ==============================================================================

aws_profile = "default"      # Specifies the AWS CLI profile to use
aws_region  = "eu-central-1" # Specifies the AWS region to deploy resources

# ==============================================================================
#                               ✨ VPC Variables ✨
# ==============================================================================

vpc_cidr                               = "10.0.0.0/16"                                       # CIDR block for the VPC
public_subnet_cidrs                    = ["10.0.0.0/18", "10.0.64.0/19", "10.0.96.0/19"]     # CIDR blocks for public subnets
private_subnet_cidrs                   = ["10.0.128.0/18", "10.0.192.0/19", "10.0.224.0/19"] # CIDR blocks for private subnets
public_rt_destination_cidr_block       = "0.0.0.0/0"                                         # Destination CIDR block for the public route table
private_rt_destination_cidr_block      = "0.0.0.0/0"                                         # Destination CIDR block for the private route table
vpc_security_group_name                = "Test-VPC-SG"                                       # Name for the VPC security group
vpc_security_group_description         = "SG for VPC"                                        # Description for the VPC security group
vpc_security_group_ingress_cidr_blocks = ["0.0.0.0/0"]                                       # Ingress CIDR blocks for the VPC security group

# ==============================================================================
#                            ✨ IAM Policy Variables ✨
# ==============================================================================

EC2CodeDeployRole   = "BG-EC2CodeDeployRole"
EC2CodeDeployPolicy = "BG-EC2CodeDeployPolicy"
CodeDeployRole      = "BG-CodeDeployRole"
CodeDeployPolicy    = "BG-CodeDeployPolicy"

# ==============================================================================
#                            ✨ EC2 Variables✨
# ==============================================================================

instance_type       = "t2.micro"
key_name            = "BG_TF"
volume_size         = 20
volume_type         = "gp3"
security_group_name = "TF-EC2-SG"
ami_name            = "TF-AMI"


# ==============================================================================
#                            ✨ TG Variables✨
# ==============================================================================

tg_name     = "TF-TG"
tg_port     = 80
tg_protocol = "HTTP"


tg_attachment_port = 80
target_type        = "instance"
health_check = {
  "timeout"             = "10"
  "interval"            = "20"
  "path"                = "/"
  "port"                = "80"
  "unhealthy_threshold" = "2"
  "healthy_threshold"   = "3"
}

# ==============================================================================
#                            ✨ LB Variables✨
# ==============================================================================

lb_name                     = "TF-ALB"
load_balancer_type          = "application"
aws_lb_listener_port        = 80
aws_lb_listener_protocol    = "HTTP"
aws_lb_listener_action_type = "forward"

# ==============================================================================
#                            ✨ ASG Variables✨
# ==============================================================================

lt_name          = "TF-ASG-LT"
lt_instance_type = "t2.micro"

asg_name                 = "TF-ASG"
asg_availability_zones   = ["ap-south-1b", "ap-south-1a"]
asg_desired_capacity     = 1
asg_max_size             = 2
asg_min_size             = 1
asg_health_check_type    = "EC2"
asg_termination_policies = ["OldestInstance"]
default_cooldown         = 3

asg_policy_name                   = "asg_policy"
asg_policy_type                   = "TargetTrackingScaling"
asg_policy_target_value           = 30
asg_policy_predefined_metric_type = "ASGAverageCPUUtilization"


# ==============================================================================
#                            ✨ BlueGreenPipeline Variables✨
# ==============================================================================

ApplicationName     = "ApplicationTF"
DeploymentGroupName = "TF-Deployment"
# targetgroup = "arn:aws:elasticloadbalancing:eu-central-1:533267294726:targetgroup/TF-targets/f3cb8f912375ee58"