#EC2 SG 
resource "aws_security_group" "example" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id

  ingress {
    description = "All Inbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All Outhbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#EC2
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id_1
  #make sure you use SG ID insted of SG name when our subnet is also define
  security_groups = [aws_security_group.example.id]
  key_name = var.key_name
  iam_instance_profile = var.role

  # Define storage
  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  #RUN Script
  user_data = file("/home/ubuntu/Terraform/BlueGreen_Terraform/modules/3.EC2/script.sh")
}

#Create AMI  of this EC2 that used in ASG
resource "aws_ami_from_instance" "myAMI" {
  name               = var.ami_name
  source_instance_id = aws_instance.myec2.id
}

