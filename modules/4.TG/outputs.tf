output "target_group_arn" {
  value = aws_lb_target_group.my_tg.arn
}
output "target_group_name" {
  value = aws_lb_target_group.my_tg.name
}
