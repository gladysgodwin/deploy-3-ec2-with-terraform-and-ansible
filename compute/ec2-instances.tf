resource "aws_instance" "server1" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.Public1a.id
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"
  tags = {
    Name = "love"
  }
}

resource "aws_instance" "server2" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.Public2b.id
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"
  tags = {
    Name = "love2"
  }
}

resource "aws_instance" "server3" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.Public1a.id
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"

  tags = {
    Name = "love3"
  }
}
