resource "aws_vpc" "lab" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "username_lab"
    owner = var.owner
    expire-on = var.expire
  }
}

resource "aws_subnet" "lab" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "username_lab_private"
    owner = var.owner
    expire-on = var.expire
}
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.lab.id

  tags = {
    Name = "username_lab_gw"
    owner = var.owner
    expire-on = var.expire
 }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "username_lab_main"
    owner = var.owner
    expire-on = var.expire
  }  
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.lab.id
  route_table_id = aws_route_table.route.id
}
