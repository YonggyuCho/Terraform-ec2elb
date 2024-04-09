### TCP 22#####
resource "aws_security_group" "yong-sg-ssh" {
    name = "yong-sg-ssh"
    vpc_id = aws_vpc.yong-aws_vpc.id
    description = "for ssh"
    tags = {
        "Name" = "yong-sg-ssh"
    }

}
resource "aws_security_group_rule" "yong-sg-ssh-ingress-role" {   # 인바운드
    security_group_id = aws_security_group.yong-sg-ssh.id
    type = "ingress"
    description = "allow ssh"
    to_port = 22
    protocol = "tcp"
    from_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]

}

resource "aws_vpc_security_group_egress_rule" "yong-sg-ssh-egress-role" {  #아웃바운드
    security_group_id = aws_security_group.yong-sg-ssh.id
    description = "allow all outbound"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}
### TCP 80, 443 #####
resource "aws_security_group" "yong-sg-http-https" {
    name = "yong-sg-http-https"
    vpc_id = aws_vpc.yong-aws_vpc.id
    description = "for HTTP,HTTPS"
    tags = {
        "Name" = "yong-sg-http-https"
    }

}
resource "aws_vpc_security_group_ingress_rule" "yong-sg-http-ingress-role" {
    security_group_id = aws_security_group.yong-sg-http-https.id
    description = "allow http inbound"
    ip_protocol = "tcp"
    to_port = 80
    from_port = 80
    cidr_ipv4 = "0.0.0.0/0"

}
resource "aws_vpc_security_group_ingress_rule" "yong-sg-https-ingress-role" {
    security_group_id = aws_security_group.yong-sg-http-https.id
    description = "allow https inbound"
    ip_protocol = "tcp"
    to_port = 443
    from_port = 443
    cidr_ipv4 = "0.0.0.0/0"     
}

resource "aws_vpc_security_group_egress_rule" "yong-sg-http-https-egress-role" {  #아웃바운드
    security_group_id = aws_security_group.yong-sg-http-https.id
    description = "allow all outbound"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}