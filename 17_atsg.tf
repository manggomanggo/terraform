resource "aws_placement_group" "jmg_pg" {
    name = "jmg-pg"
    strategy = "cluster"
}

resource "aws_autoscaling_group" "jmg_atsg" {
    name = "jmg-atsg"
    min_size = 2
    max_size = 10
    health_check_grace_period = 60
    health_check_type = "EC2"
    desired_capacity = 2
    force_delete = true
    launch_configuration = aws_launch_configuration.jmg_lacf.name
    #placement_group = aws_placement_group.jmg_pg.id
    vpc_zone_identifier = [aws_subnet.jmg_puba.id,aws_subnet.jmg_pubc.id]
}