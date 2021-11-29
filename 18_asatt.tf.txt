resource "aws_autoscaling_attachment" "jmg_asatt" {
    autoscaling_group_name = aws_autoscaling_group.jmg_atsg.id
    alb_target_group_arn = aws_lb_target_group.jmg_albtg.id
}