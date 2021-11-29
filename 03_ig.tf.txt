resource "aws_internet_gateway" "jmg_ig" {
  vpc_id = aws_vpc.jmg_vpc.id

  tags = {
    Name = "jmg-ig"
  }
}