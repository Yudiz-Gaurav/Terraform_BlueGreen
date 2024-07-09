# ==============================================================================
#                                ✨ terraform ✨
# ==============================================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specifies the source of the AWS provider
      version = "~> 3.27"       # Specifies the version of the AWS provider to be used
    }
  }

  required_version = ">= 0.14.9" # Specifies the required Terraform version
}

# ==============================================================================
#                                  ✨ VPC Module ✨
# ==============================================================================

module "VPC" {
  source = "./modules/1.VPC" # Specifies the source path for the VPC module

  vpc_cidr                           = var.vpc_cidr                               # CIDR block for the VPC
  public_subnet_cidrs                = var.public_subnet_cidrs                    # CIDR blocks for public subnets
  private_subnet_cidrs               = var.private_subnet_cidrs                   # CIDR blocks for private subnets
  public_rt_destination_cidr_block   = var.public_rt_destination_cidr_block       # Destination CIDR block for public route table
  private_rt_destination_cidr_block  = var.private_rt_destination_cidr_block      # Destination CIDR block for private route table
  security_group_name                = var.vpc_security_group_name                # Name for the VPC security group
  security_group_description         = var.vpc_security_group_description         # Description for the VPC security group
  security_group_ingress_cidr_blocks = var.vpc_security_group_ingress_cidr_blocks # Ingress CIDR blocks for the VPC security group
}


# # ==============================================================================
# #                              ✨ IAM Policy Module ✨
# # ==============================================================================

module "IAMPolicy" {
  source              = "./modules/2.IAMPolicy" # Specifies the source path for the IAM Policy module
  EC2CodeDeployRole   = var.EC2CodeDeployRole
  EC2CodeDeployPolicy = var.EC2CodeDeployPolicy
  CodeDeployRole      = var.CodeDeployRole
  CodeDeployPolicy    = var.CodeDeployPolicy
}

# # ==============================================================================
# #                              ✨ EC2 Module ✨
# # ==============================================================================

module "Ec2" {
  source              = "./modules/3.EC2"
  vpc_id              = module.VPC.vpc_id
  subnet_id_1         = module.VPC.vpc_subnet_id_1
  subnet_id_2         = module.VPC.vpc_subnet_id_2
  key_name            = var.key_name
  security_group_name = var.security_group_name
  instance_type       = var.instance_type
  volume_size         = var.volume_size
  volume_type         = var.volume_type
  ami_name            = var.ami_name
  role = module.IAMPolicy.BG-EC2CodeDeployInstanceProfile

}

# # ==============================================================================
# #                              ✨ TG Module ✨
# # ==============================================================================

module "TG" {
  source             = "./modules/4.TG"
  tg_name            = var.tg_name
  tg_port            = var.tg_port
  tg_protocol        = "HTTP"
  vpc_id             = module.VPC.vpc_id
  tg_id              = module.Ec2.ec2_id
  tg_attachment_port = var.tg_attachment_port
  target_type        = var.target_type
  health_check       = var.health_check
}

# # ==============================================================================
# #                              ✨ LB Module ✨
# # ==============================================================================


module "LB" {
  source = "./modules/5.LB"

  lb_name                     = var.lb_name
  load_balancer_type          = var.load_balancer_type
  sg_id                       = [module.VPC.vpc_sg]
  subnets_id                  = [module.VPC.vpc_subnet_id_1, module.VPC.vpc_subnet_id_2]
  aws_lb_listener_port        = var.aws_lb_listener_port
  aws_lb_listener_protocol    = var.aws_lb_listener_protocol
  aws_lb_listener_action_type = var.aws_lb_listener_action_type
  target_group_arn            = module.TG.target_group_arn
}

# # ==============================================================================
# #                              ✨ ASG Module ✨
# # ==============================================================================

module "ASG" {
  source = "./modules/6.ASG"

  lt_name                           = var.lt_name
  lt_ami_img                        = module.Ec2.ami_id
  lt_instance_type                  = var.lt_instance_type
  asg_name                          = var.asg_name
  asg_availability_zones            = var.asg_availability_zones
  asg_desired_capacity              = var.asg_desired_capacity
  asg_max_size                      = var.asg_max_size
  asg_min_size                      = var.asg_min_size
  asg_vpc_zone_identifier           = [module.VPC.vpc_subnet_id_1, module.VPC.vpc_subnet_id_2]
  asg_health_check_type             = var.asg_health_check_type
  asg_termination_policies          = var.asg_termination_policies
  default_cooldown                  = var.default_cooldown
  target_group_arns                 = [module.TG.target_group_arn]
  asg_policy_name                   = var.asg_policy_name
  asg_policy_type                   = var.asg_policy_type
  asg_policy_target_value           = var.asg_policy_target_value
  asg_policy_predefined_metric_type = var.asg_policy_predefined_metric_type
}


# # # # ==============================================================================
# # # #                              ✨ BlueGreenPipeline Module ✨
# # # # ==============================================================================

module "BlueGreenPipeline" {
  source              = "./modules/7.BlueGreenPipeline" # Specifies the source path for the IAM Policy module
  ApplicationName     = var.ApplicationName
  DeploymentGroupName = var.DeploymentGroupName
  CodeDeployARN       = module.IAMPolicy.CodeDeployRole.arn
  targetgroup         = module.TG.target_group_name
  ASG = module.ASG.ASG
}


