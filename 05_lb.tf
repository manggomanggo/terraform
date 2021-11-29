resource "aws_lb" "jmg_alb" {
    name = "jmg-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.jmg_sg.id]
    subnets = [aws_subnet.jmg_pub[0].id]
    tags = {
        "Name" = "jmg-alb"
    }
}

output "dns_name" {
    value = aws_lb.jmg_alb.dns_name
}

resource "aws_lb_target_group" "jmg_albtg" {
    name = "jmg-albtg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.jmg_vpc.id

    health_check {
        enabled = true
        healthy_threshold = 3
        interval = 5
        matcher = "200"
        path = "/health.html"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 2
        unhealthy_threshold = 2
    }
}

resource "aws_lb_listener" "jmg_albis" {
    load_balancer_arn = aws_lb.jmg_alb.arn
    port = 80
    protocol = var.http

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.jmg_albtg.arn
    } 
}

resource "aws_lb_target_group_attachment" "jmg_albtgatt" {
    target_group_arn = aws_lb_target_group.jmg_albtg.arn
    target_id = aws_instance.jmg_web.id
 
    port = 80
}