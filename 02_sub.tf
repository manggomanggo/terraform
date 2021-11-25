# 가용영역 a의 public subnet
resource "aws_subnet" "jmg_puba" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "jmg_puba"
    }
}

resource "aws_subnet" "jmg_pubd" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.1.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "jmg_pubc"
    }
}

resource "aws_subnet" "jmg_pria" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.2.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "jmg_pria"
    }
}

resource "aws_subnet" "jmg_pric" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.3.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "jmg_pric"
    }
}

resource "aws_subnet" "jmg_pridba" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.4.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "jmg_pridba"
    }
}

resource "aws_subnet" "jmg_pridbc" {
    vpc_id = aws_vpc.jmg_vpc.id
    cidr_block ="10.0.5.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "jmg_pridbc"
    }
}