resource "aws_internet_gateway" "yong-ig" {
    vpc_id = aws_vpc.yong-aws_vpc.id
    tags = {
      "Name" = "yong-ig"
    }
  
}