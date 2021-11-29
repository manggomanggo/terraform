resource "aws_eip" "jmg_ngw_ip" {
    vpc = true
} 

resource "aws_nat_gateway" "jmg_ngw" {
    allocation_id = aws_eip.jmg_ngw_ip.id
    subnet_id = aws_subnet.jmg_pub[0].id
    tags = {
        "Name" = "${var.name}-ngw"
    }
}

resource "aws_route_table" "jmg_ngwrt" {
    vpc_id = aws_vpc.jmg_vpc.id

    route {
        cidr_block = var.cidr_route
        gateway_id = aws_nat_gateway.jmg_ngw.id
    }
    tags = {
        "Name" = "${var.name}-ngwrt"
    }
}

resource "aws_route_table_association" "jmg_ngwass_pri" {
    count = length(var.pri_sub)  #2
    subnet_id = aws_subnet.jmg_pri[count.index].id
    route_table_id = aws_route_table.jmg_ngwrt.id
}

resource "aws_route_table_association" "jmg_ngwass_pridb" {
    count = length(var.pri_subdb)    #2
    subnet_id = aws_subnet.jmg_pridb[count.index].id
    route_table_id = aws_route_table.jmg_ngwrt.id
}

