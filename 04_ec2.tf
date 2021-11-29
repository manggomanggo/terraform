resource "aws_security_group" "jmg_sg" {
    name = "${var.name}-websg"
    description = "HTTP_ICMP_SQL"
    vpc_id = aws_vpc.jmg_vpc.id

    ingress = [
        {
            description     = "var.ssh"
            from_port       = var.port_ssh
            to_port         = var.port_ssh
            protocol        = var.pro_tcp
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_routev6]
            prefix_list_ids = var.nul
            security_groups = var.nul
            self = var.nul
        },
        {
            description = var.http
            from_port = 80
            to_port = 80
            protocol = var.pro_tcp
            cidr_blocks = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_routev6]
            prefix_list_ids = var.nul
            security_groups = var.nul
            self = var.nul
        },
        {
            description = "icmp"
            from_port = -1
            to_port = -1
            protocol = var.icmp
            cidr_blocks = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_routev6]
            prefix_list_ids = var.nul
            security_groups = var.nul
            self = var.nul
        },
        {
            description = var.mysql
            from_port = var.port_mysql
            to_port = var.port_mysql
            protocol = var.pro_tcp
            cidr_blocks = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_routev6]
            prefix_list_ids = var.nul
            security_groups = var.nul
            self = var.nul
        }
    ]

    egress = [
        {
            description = "all"
            from_port = var.port_zero
            to_port = var.port_zero
            protocol = -1
            cidr_blocks = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_routev6]
            prefix_list_ids = var.nul
            security_groups = var.nul
            self = var.nul
        }
    ]
    tags = {
        "Name" = "$-sg"
    }
}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "jmg_web" {
 ami = data.aws_ami.amzn.id
 instance_type = "var-t2"
 key_name = "var-key"
 vpc_security_group_ids = [aws_security_group.jmg_sg.id]
 availability_zone = "var-region"
 private_ip = "10.0.0.11"
 subnet_id = aws_subnet.jmg_pub[0].id
 user_data = file("./install.sh")
 
 tags = {
     "Name" = "jmg-web"
 }
}

resource "aws_eip" "jmg_web_ip" {
    vpc = true
    instance = aws_instance.jmg_web.id
    associate_with_private_ip = "10.0.0.11"
    depends_on = [aws_internet_gateway.jmg_ig]
}

output "public_ip" {
    value = aws_instance.jmg_web.public_ip
}