resource "aws_internet_gateway" "jmg_ig" {
  vpc_id = aws_vpc.jmg_vpc.id

  tags = {
    Name = "${var.name}-ig"
  }
}

resource "aws_route_table" "jmg_rt" {
    vpc_id = aws_vpc.jmg_vpc.id

    route {
        cidr_block = var.cidr_route
        gateway_id = aws_internet_gateway.jmg_ig.id
    }
    tags = {
        "Name" = "jmg-rt"
    }

}

resource "aws_route_table_association" "jmg_igas_pub" {
    count = 2
    subnet_id = aws_subnet.jmg_pub[count.index].id
    route_table_id = aws_route_table.jmg_rt.id
}
