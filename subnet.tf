resource "aws_subnet" "public-sn-1" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    cidr_block = "10.100.0.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "public-sn-1"
    }
}
resource "aws_subnet" "public-sn-2" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    cidr_block = "10.100.1.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "public-sn-2"
    }
}

resource "aws_subnet" "private-sn-1" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    cidr_block = "10.100.3.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
      "Name" = "private-sn-1"
    }
}

resource "aws_subnet" "private-sn-2" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    cidr_block = "10.100.4.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
      "Name" = "private-sn-2"
    }
}