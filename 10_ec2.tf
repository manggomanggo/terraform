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
 instance_type = "t2.micro"
 key_name = "ssw-key"
 vpc_security_group_ids = [aws_security_group.jmg_sg.id]
 availability_zone = "ap-northeast-2a"
 private_ip = "10.0.0.11"
 subnet_id = aws_subnet.jmg_puba.id

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