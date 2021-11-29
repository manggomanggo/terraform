resource "aws_db_instance" "jmg_mydb" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = var.mysql
    engine_version = "8.0"
    instance_class = db.var.t2
    name = "mydb"
    identifier = "mydb"
    username = "admin"
    password = "123456789"
    parameter_group_name = "default.mysql8.0"
    availability_zone = var.region
    db_subnet_group_name = aws_db_subnet_group.jmg_dbsg.id
    vpc_security_group_ids = [aws_security_group.jmg_sg.id]
    skip_final_snapshot = true
    tags = {
        "Name" = "jmg-db"
    }   
}

resource "aws_db_subnet_group" "jmg_dbsg" {
    name ="jmg-dbsg"
    subnet_ids = [aws_subnet.jmg_pridb[0].id,aws_subnet.jmg_pridb[1].id]
}