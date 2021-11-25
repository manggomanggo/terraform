resource "aws_key_pair" "ssw_key" {
    key_name = "ssw-key"
    public_key = file("../../.ssh/ssw-key.pub")
}