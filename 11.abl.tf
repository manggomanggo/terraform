resource "aws_lb" "jmg_alb" {
    name = "jmg-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.jmg_sg.id]
    subnets = [aws_subnet.jmg_puba.id,aws_subnet.jmg_pubc.id]
    tags = {
        "Name" = "jmg-alb"
    }
}