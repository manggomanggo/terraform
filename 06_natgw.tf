resource "aws_eip" "jmg_ngw_ip" {
    vpc = true
}

resource "aws_nat_gateway" "jmg_ngw" {
    allocation_id = aws_eip.jmg_ngw_ip.id
    subnet_id = aws_subnet.jmg_puba.id
    tags = {
        "Name" = "jmg-ngw"
    }
}