# ==============================================================================
#                  ✨ EksClusterServiceRole & AmazonEKSNodeRole ✨
# ==============================================================================

# For EC2 Server
resource "aws_iam_role" "EC2CodeDeployRole" {
  name = var.EC2CodeDeployRole

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "codedeploy.eu-central-1.amazonaws.com",
            "ec2.amazonaws.com"
          ]
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

# Define the policy for the EC2 role
resource "aws_iam_policy" "EC2CodeDeployPolicy" {
  name = var.EC2CodeDeployPolicy

  policy = file("/home/ubuntu/Terraform/BlueGreen_Terraform/modules/2.IAMPolicy/EC2CodeDeployPolicy.json")
}

# For CodeDeploy
resource "aws_iam_role" "CodeDeployRole" {
  name = var.CodeDeployRole

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "codedeploy.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

# Define the policy for the CodeDeploy role
resource "aws_iam_policy" "CodeDeployPolicy" {
  name = var.CodeDeployPolicy

  policy = file("/home/ubuntu/Terraform/BlueGreen_Terraform/modules/2.IAMPolicy/CodeDeployPolicy.json")
}

# Attach the policy to the CodeDeploy role
resource "aws_iam_role_policy_attachment" "AWSCodeDeployRolePolicyAttachment" {
  policy_arn = data.aws_iam_policy.AWSCodeDeployRole.arn
  role       = aws_iam_role.CodeDeployRole.name
}

resource "aws_iam_role_policy_attachment" "CodeDeployRolePolicyAttachment" {
  policy_arn = aws_iam_policy.CodeDeployPolicy.arn
  role       = aws_iam_role.CodeDeployRole.name
}

resource "aws_iam_role_policy_attachment" "EC2CodeDeployRolePolicyAttachment" {
  policy_arn = aws_iam_policy.EC2CodeDeployPolicy.arn
  role       = aws_iam_role.EC2CodeDeployRole.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "BG-EC2CodeDeployInstanceProfile"
  role = aws_iam_role.EC2CodeDeployRole.name
}
