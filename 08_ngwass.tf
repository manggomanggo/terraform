resource "aws_route_table_association" "jmg_ngwass_pria" {
    subnet_id = aws_subnet.jmg_pria.id
    route_table_id = aws_route_table.jmg_ngwrt.id
}

resource "aws_route_table_association" "jmg_ngwass_pric" {
    subnet_id = aws_subnet.jmg_pric.id
    route_table_id = aws_route_table.jmg_ngwrt.id
}

resource "aws_route_table_association" "jmg_ngwass_pridba" {
    subnet_id = aws_subnet.jmg_pridba.id
    route_table_id = aws_route_table.jmg_ngwrt.id
}

resource "aws_route_table_association" "jmg_ngwass_pridbc" {
    subnet_id = aws_subnet.jmg_pridbc.id
    route_table_id = aws_route_table.jmg_ngwrt.id
}