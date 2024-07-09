# ==============================================================================
#                                 ✨ Outputs ✨
# ==============================================================================

# Output for VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}

# Output for Public Subnet 1 ID
output "vpc_subnet_id_1" {
  value = aws_subnet.public-subnet-1.id
}

# Output for Public Subnet 2 ID
output "vpc_subnet_id_2" {
  value = aws_subnet.public-subnet-2.id
}

# Output for VPC Security Group ID
output "vpc_sg" {
  value = aws_security_group.vpc_sg.id
}
