resource "aws_lb_listener" "jmg_albis" {
    load_balancer_arn = aws_lb.jmg_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.jmg_albtg.arn
    } 
}