resource "aws_route_table" "jmg_ngwrt" {
    vpc_id = aws_vpc.jmg_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.jmg_ngw.id
    }
    tags = {
        "Name" = "jmg-ngwrt"
    }
}