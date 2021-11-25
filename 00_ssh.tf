resource "aws_key_pair" "ssw_key" {
    key_name = "ssw-key"
    public_key = file("../../.ssh/ssw_key.pub")
    #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpuGlPv3mqVwbWue8EliEJ3unPz6nDU1PnJU0MnkG20i1ZWw0NkctLdt+MxapsjIG/LZLxM4+hgClFvL3Elketz1IM0wYLMRljxqT5+2kQJZwrh6JF/NGB7OUPjTEAxprPOsZL6TCbvugEhD2Y81HmPE0ELtKlf7JTireLNf/NgehXDCyUonzGa7UzMhPn5TnNYsiI24tcWiQO4I5Nu8b6tZGwo0BHFs2DxBGNvn3fsR2/mP4j10+Fl4ms6/8ZMN45E6OP8yr0YMTg+kFz0IA+uhYA9gsAtHzkHwC8EUW2qUEkPFK6j1vizH1i3bO/WMWThShbSMTb9aRGRshu3lWlbH1k5Ni2NIFbirwRp4gqQSIukEYVy/1h8iZUUw5efSKAMANz6WhngxMDxaqn9f8Mham75qKi8+zwCwtEKr0Z6x2txjOr9myhJQsuevDeQAXvqknDxcfIlbfjjQZNuerJqfmdsxarljMu8txpdJKry/0KXvfPsNlwApCHkIdvBpM="
}