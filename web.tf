resource "aws_instance" "web01" {
    tags = {
      "Name" = "web01"
    }
    ami = "ami-01711d925a1e4cc3a"
    instance_type = "t2.micro"
    key_name = "yongssh"
    vpc_security_group_ids = [ aws_default_security_group.yong-default.id, aws_security_group.yong-sg-http-https.id ]
    subnet_id = aws_subnet.private-sn-1.id
    associate_public_ip_address = "false"
    user_data = <<EOF
    #! /bin/bash
      sudo amazon-linux-extras install nginx1
      sudo systemctl start nginx
      sudo systemctl enable nginx
      echo "This is Test Server 1" | sudo tee /usr/share/nginx/html/index.html
    EOF

    root_block_device {
        volume_size = "10"
        volume_type = "gp3"
        tags = {
            "Name" = "web01"
        }
      
    } 

}

resource "aws_instance" "web02" {
    tags = {
      "Name" = "web02"
    }
    ami = "ami-01711d925a1e4cc3a"
    instance_type = "t2.micro"
    key_name = "yongssh"
    vpc_security_group_ids = [ aws_default_security_group.yong-default.id, aws_security_group.yong-sg-http-https.id ]
    subnet_id = aws_subnet.private-sn-2.id
    associate_public_ip_address = "false"
    user_data = <<EOF
    #! /bin/bash
      sudo amazon-linux-extras install nginx1
      sudo systemctl start nginx
      sudo systemctl enable nginx
      echo "This is Test Server 2" | sudo tee /usr/share/nginx/html/index.html
    EOF

    root_block_device {
        volume_size = "10"
        volume_type = "gp3"
        tags = {
            "Name" = "web02"
        }
      
    } 

}