resource "aws_ami_from_instance" "jmg_ami" {
    name = "jmg-ami"
    source_instance_id = aws_instance.jmg_web.id
    depends_on = [
        aws_instance.jmg_web
    ]
}

resource "aws_launch_configuration" "jmg_lacf" {
    name = "jmg-lacf"
    image_id = aws_ami_from_instance.jmg_ami.id
    instance_type = var.t2
    iam_instance_profile = "admin_role"
    security_groups = [aws_security_group.jmg_sg.id]
    key_name = var-key
    user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
                
}

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
    force_delete = false
    launch_configuration = aws_launch_configuration.jmg_lacf.name
    #placement_group = aws_placement_group.jmg_pg.id
    vpc_zone_identifier = [aws_subnet.jmg_pub[0].id,aws_subnet.jmg_pub[1].id]
}

resource "aws_autoscaling_attachment" "jmg_asatt" {
    autoscaling_group_name = aws_autoscaling_group.jmg_atsg.id
    alb_target_group_arn = aws_lb_target_group.jmg_albtg.id
}