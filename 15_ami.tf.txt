resource "aws_ami_from_instance" "jmg_ami" {
    name = "jmg-ami"
    source_instance_id = aws_instance.jmg_web.id
    depends_on = [
        aws_instance.jmg_web
    ]
}