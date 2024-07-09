# =======================================
#       ✨ EKS IAM Role Variables ✨
# =======================================

# EKS Cluster Role Name
variable "EC2CodeDeployRole" {
  description = "Name of the IAM role for EC2"
  type        = string
}

variable "EC2CodeDeployPolicy" {
  description = "Name of the IAM role for EC2"
  type        = string
}

# EKS Node Group Role Name
variable "CodeDeployRole" {
  description = "Name of the IAM role for CodeDeployRole"
  type        = string
}

variable "CodeDeployPolicy" {
  description = "Name of the IAM role for CodeDeployRole"
  type        = string
}


