resource "aws_vpc" "yong-aws_vpc" {
    cidr_block = "10.100.0.0/16"
    tags = {
        "Name" = "yong-vpc"
    }
}