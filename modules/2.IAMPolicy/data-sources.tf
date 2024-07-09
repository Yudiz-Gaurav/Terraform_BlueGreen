# ==============================================================================
#                       ✨ Fetch Policies for EKS Cluster ✨
# ==============================================================================

# Fetch AWSCodeDeployRole for EC2
data "aws_iam_policy" "AWSCodeDeployRole" {
  name = "AWSCodeDeployRole"
}
