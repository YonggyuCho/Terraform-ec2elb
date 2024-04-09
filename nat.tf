resource "aws_eip" "yong-eip" { 
    tags = {
      "Name"="yong-eip"
    }
}
resource "aws_nat_gateway" "yong-nat" {
    allocation_id = aws_eip.yong-eip.id
    subnet_id = aws_subnet.public-sn-1.id
    tags = {
      "Name" = "yong-nat"
    }
}

