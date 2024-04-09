resource "aws_eip" "bastion-eip" {
    tags = {
        "Name" = "bastion-eip"
    }
}
resource "aws_instance" "bastion-host" {
    tags = {
      "Name" = "bastion-host"
    }
    ami = "ami-04ab8d3a67dfe6398"
    instance_type = "t2.micro"
    key_name = "yongssh"
    vpc_security_group_ids = [ aws_default_security_group.yong-default.id, aws_security_group.yong-sg-ssh.id ]
    subnet_id = aws_subnet.public-sn-1.id
    associate_public_ip_address = "true"
    root_block_device {
      volume_size = "10"
      volume_type = "gp3"
    }
    
}
resource "aws_eip_association" "bastion-eip-associate" {
    instance_id = aws_instance.bastion-host.id
    allocation_id = aws_eip.bastion-eip.id
  
}