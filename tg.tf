#Create an ALB target group

resource "aws_lb_target_group" "my-alb-tg" {
  name     = "my-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myprivNet.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "server1" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = "${aws_instance.server1.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "server2" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = aws_instance.server2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "server3" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = aws_instance.server3.id
  port             = 80
}