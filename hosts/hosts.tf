data "aws_ami" "aws-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20210326.0-x86_64-gp2"]
  }

  owners = ["amazon"]
}

data "aws_ami" "rhel-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-7.8_HVM-20200803-x86_64-0-Hourly2-GP2"]
  }

  owners = ["309956199498"]
}

resource "aws_instance" "om1" {
  ami           = data.aws_ami.aws-linux.id
  instance_type = "t2.large"
  key_name      = aws_key_pair.aws-linux.key_name
  vpc_security_group_ids = [aws_security_group.lab_group.id]
  tags = {
    Name = "username_lab_om1"
    owner = var.owner
    expire-on = var.expire
  }  
}

# resource "aws_instance" "om2" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.large"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_om2"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
#
# resource "aws_instance" "om3" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.large"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_om3"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
#
# resource "aws_instance" "ins-1" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.small"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_dep1"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
#
# resource "aws_instance" "ins-2" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.small"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_dep2"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
#
# resource "aws_instance" "ins-3" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.small"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_dep3"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
#
# resource "aws_instance" "ldap" {
#   ami           = data.aws_ami.aws-linux.id
#   instance_type = "t2.small"
#   key_name      = aws_key_pair.aws-linux.key_name
#   vpc_security_group_ids = [aws_security_group.lab_group.id]
#   tags = {
#     Name = "username_lab_ldap"
#     owner = var.owner
#     expire-on = var.expire
#   }
# }
