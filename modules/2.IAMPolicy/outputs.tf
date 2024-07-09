# # ==============================================================================
# #                     ✨ Export Roles ✨
# # ==============================================================================

output "CodeDeployRole" {
  value = aws_iam_role.CodeDeployRole
}

output "EC2CodeDeployRole" {
  value = aws_iam_role.EC2CodeDeployRole
}

output "BG-EC2CodeDeployInstanceProfile" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}