resource "aws_lb_target_group_attachment" "jmg_albtgatt" {
    target_group_arn = aws_lb_target_group.jmg_albtg.arn
    target_id = aws_instance.jmg_web.id
    port = 80
}