resource "aws_route_table" "jmg_rt" {
    vpc_id = aws_vpc.jmg_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.jmg_ig.id
    }
    tags = {
        "Name" = "jmg-rt"
    }

}