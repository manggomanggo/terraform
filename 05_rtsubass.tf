resource "aws_route_table_association" "jmg_igas_puba" {
    subnet_id = aws_subnet.jmg_puba.id
    route_table_id = aws_route_table.jmg_rt.id
}

resource "aws_route_table_association" "jmg_igas_pubc" {
    subnet_id = aws_subnet.jmg_pubc.id
    route_table_id = aws_route_table.jmg_rt.id
}