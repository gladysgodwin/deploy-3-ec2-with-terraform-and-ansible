resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg.id]
  subnets            = [aws_subnet.Public1a.id, aws_subnet.Public2b.id]
  depends_on = [
    aws_instance.server1,
    aws_instance.server2,
  aws_instance.server3]
}

resource "aws_lb_listener" "lb_lst" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }
}

resource "aws_lb_listener_rule" "dom-rule" {
  listener_arn = aws_lb_listener.lb_lst.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }

  condition {
    host_header {
      values = ["terraform-test.praestohealth.com.ng"]
    }
  }
}