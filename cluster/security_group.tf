resource "aws_security_group" "lab_group" {
  name        = "lab_group"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description = "SSH for VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.local-public-ip]
  }

  ingress {
    description = "WebServer for VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.local-public-ip]
  }
 
  ingress {
    description = "WebServer for VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.local-public-ip]
  } 
  
  ingress {
    description = "WebServer for VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.local-public-ip]
  }

  ingress {
    description = "internal ssh"
    from_port   = 22
    to_port     = 22 
    protocol    = "tcp"
    self 	= true
  }
   
  ingress {
    description = "internal OM"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    self 	= true
  }

  ingress {
    description = "internal LDAP"
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    self 	= true
  }

  ingress {
    description = "MongoDB Ports"
    from_port   = 27017
    to_port     = 27020
    protocol    = "tcp"
    self 	= true
  }

  ingress {
    description = "ICMP"
    from_port   = -1 
    to_port     = -1
    protocol    = "icmp"
    self 	= true  
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
