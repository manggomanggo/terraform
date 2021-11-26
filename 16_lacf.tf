resource "aws_launch_configuration" "jmg_lacf" {
    name = "jmg-lacf"
    image_id = aws_ami_from_instance.jmg_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = "admin_role"
    security_groups = [aws_security_group.jmg_sg.id]
    key_name = "ssw-key"
    user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
                
}
