# ==============================================================================
#                                  ✨ VPC Configuration ✨
# ==============================================================================

# Variable for VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# Variable for Public Subnet CIDR blocks
variable "public_subnet_cidrs" {
  description = "CIDR block for the public subnet"
  type        = list(string)
}

# Variable for Private Subnet CIDR blocks
variable "private_subnet_cidrs" {
  description = "CIDR block for the private subnet"
  type        = list(string)
}

# Variable for Public Route Table destination CIDR block
variable "public_rt_destination_cidr_block" {
  description = "Destination CIDR block for public route table"
  type        = string
}

# Variable for Private Route Table destination CIDR block
variable "private_rt_destination_cidr_block" {
  description = "Destination CIDR block for private route table"
  type        = string
}

# ==============================================================================
#                               ✨ VPC Security Group ✨
# ==============================================================================

# Variable for Security Group Name
variable "security_group_name" {
  description = "Name for the security group"
  type        = string
}

# Variable for Security Group Description
variable "security_group_description" {
  description = "Description for the security group"
  type        = string
}

# Variable for CIDR blocks for Security Group ingress rules
variable "security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for security group ingress rules"
  type        = list(string)
}
