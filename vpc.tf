provider "aws" {
  region = var.region
}

resource "aws_vpc" "myprivNet" {
  cidr_block = var.cidr_block

  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_subnet" "myprivNet" {
  for_each = var.subnets

  cidr_block              = each.value["cidr"]
  vpc_id                  = aws_vpc.myprivNet.id
  availability_zone       = each.value["az"]
  map_public_ip_on_launch = true
  tags = {
    Name = "${each.key}"
  }
}

resource "aws_internet_gateway" "love-igw" {
  vpc_id = aws_vpc.myprivNet.id

  tags = {
    "Name" = "love-igw"
  }
}


resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.myprivNet.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.love-igw.id
  }

  tags = {
    "Name" = "publicRT"
  }
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.myprivNet.id

  tags = {
    "Name" = "privateRT"
  }
}

resource "aws_route_table_association" "public-association" {
  for_each       = aws_subnet.myprivNet
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = each.value.id
}

/*
resource "aws_route_table_association" "private-association" {
  for_each       = aws_subnet.myprivNet
  route_table_id = aws_route_table.privateRT.id
  subnet_id      = each.value.index.id
}
*/


