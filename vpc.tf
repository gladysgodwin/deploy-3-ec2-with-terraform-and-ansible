provider "aws" {
  region = var.region
}

resource "aws_vpc" "myprivNet" {
  cidr_block = var.cidr_block

  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_subnet" "Public1a" {
  vpc_id                  = aws_vpc.myprivNet.id
  cidr_block              = element(var.pubsubnets, 0)
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, 0)

  tags = {
    Name = "Public1"
  }
}

#Create Public subnet #2
resource "aws_subnet" "Public2b" {
  vpc_id                  = aws_vpc.myprivNet.id
  cidr_block              = element(var.pubsubnets, 1)
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, 1)


  tags = {
    Name = "Public2b"
  }
}

#Create Private subnet #1
resource "aws_subnet" "Private1c" {
  vpc_id                  = aws_vpc.myprivNet.id
  cidr_block              = var.privsubnet
  map_public_ip_on_launch = false
  availability_zone       = element(var.azs, 2)


  tags = {
    Name = "Private1c"
  }
}

/*
resource "aws_subnet" "myprivNet" {
  for_each = var.azs

  cidr_block              = element(var.subnets, 04)
  vpc_id                  = aws_vpc.myprivNet.id
  availability_zone       = each.value["az"]
  map_public_ip_on_launch = true
  tags = {
    Name = "${each.key}"
  }
}
*/
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
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = aws_subnet.Public1a.id
}


resource "aws_route_table_association" "public-association2" {
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = aws_subnet.Public2b.id
}




