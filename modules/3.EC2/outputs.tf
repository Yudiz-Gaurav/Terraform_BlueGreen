output "public_ip" {
  value = aws_instance.myec2.public_ip
}

output "ec2_id" {
  value = aws_instance.myec2.id
}

output "ami_id" {
  value = aws_ami_from_instance.myAMI.id
}