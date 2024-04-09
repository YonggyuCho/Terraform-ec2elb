resource "aws_route_table" "yong-public-rt" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    tags = {
      "Name" = "yong-public-rt"
    }
    
  
}
resource "aws_route_table" "yong-private-rt" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    tags = {
      "Name" = "yong-private-rt"
    }
  
}

### 라우팅 ###

resource "aws_route" "yong-public-route" {
    route_table_id = aws_route_table.yong-public-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.yong-ig.id
}

resource "aws_route" "yong-private-route" {
    route_table_id = aws_route_table.yong-private-rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.yong-nat.id

}

### Route table associate ####

resource "aws_route_table_association" "yong-public-rt-as-01" {
    subnet_id = aws_subnet.public-sn-1.id
    route_table_id = aws_route_table.yong-public-rt.id
}
resource "aws_route_table_association" "yong-public-rt-as-02" {
    subnet_id = aws_subnet.public-sn-2.id
    route_table_id = aws_route_table.yong-public-rt.id
}


resource "aws_route_table_association" "yong-private-rt-as-01" {
    subnet_id = aws_subnet.private-sn-1.id
    route_table_id = aws_route_table.yong-private-rt.id
}
resource "aws_route_table_association" "yong-private-rt-as-02" {
    subnet_id = aws_subnet.private-sn-2.id
    route_table_id = aws_route_table.yong-private-rt.id
}
