resource "aws_instance" "server1" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = "subnet-04e5753ff50333140"
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"
  tags = {
    Name = "love"
  }

  provisioner "local-exec" {

    command = "echo ${self.public_ip} >> host-inventory.txt"

  }
}

resource "aws_instance" "server2" {
  #for_each        = aws_subnet.myprivNet
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = "subnet-0e41ee0177f105479"
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"
  tags = {
    Name = "love2"
  }

  provisioner "local-exec" {

    command = "echo ${self.public_ip} >> host-inventory.txt"

  }
}

resource "aws_instance" "server3" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = "subnet-08fb69feef3fd8a44"
  security_groups = [aws_security_group.my_alb_sg.id]
  key_name        = "help"

  tags = {
    Name = "love3"
  }

  provisioner "local-exec" {

    command = "echo ${self.public_ip} >> host-inventory.txt"

  }
}