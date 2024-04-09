resource "aws_lb" "web-lb" {
    name = "web-lb"
    subnets = [ aws_subnet.public-sn-1.id, aws_subnet.public-sn-2.id ]
    internal = false
    security_groups = [ aws_default_security_group.yong-default.id, aws_security_group.yong-sg-http-https.id ]
    load_balancer_type = "application"
    tags = {
      "Name" = "web-lb"
    }
    
}

####### 대상 그룹###########

resource "aws_lb_target_group" "web-tg" {
    name = "web-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.yong-aws_vpc.id
    health_check {
      port = 80
      path = "/"
    }
    tags = {
      "Name" = "web-tg"
    }
}


#### 리스너 설정#######

resource "aws_lb_listener" "web-listener" {
    load_balancer_arn = aws_lb.web-lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.web-tg.arn
      type = "forward"
    }
    tags = {
      "Name" = "web-listener"
    }
  
}

###### attached ######
resource "aws_lb_target_group_attachment" "web-tg-attached-1" {
    target_id = aws_instance.web01.id
    target_group_arn = aws_lb_target_group.web-tg.arn
    port = 80
}
resource "aws_lb_target_group_attachment" "web-tg-attached-2" {
    target_id = aws_instance.web02.id
    target_group_arn = aws_lb_target_group.web-tg.arn
    port = 80
}
