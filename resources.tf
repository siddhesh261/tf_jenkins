resource "aws_vpc" "vpc_lab5" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc for lab5"
  }
}

resource "aws_subnet" "subnet_lab5" {
  vpc_id            = aws_vpc.vpc_lab5.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.region
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet for lab5"
  }
}

resource "aws_instance" "Lab5" {
  ami                    = data.aws_ami.amz_ami.id
  instance_type          = var.instance-type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.SG_lab5.id]
  subnet_id              = aws_subnet.subnet_lab5.id
  user_data              = file("jenkins_install.sh")

  tags = {
    Name = "Lab05"
  }
}

resource "aws_security_group" "SG_lab5" {
  name   = var.security
  vpc_id = aws_vpc.vpc_lab5.id

  tags = {
    Name = "security group for Lab05"
  }
}

resource "aws_security_group_rule" "ingress" {
  description       = "Allow HTTP traffic for public"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_lab5.id
}

resource "aws_security_group_rule" "ingress_rule" {
  description       = "Allow SSH traffic for public"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_lab5.id
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow all traffic to internet"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.SG_lab5.id
}

/*resource "aws_eip" "VPC_A_EIP" {
  instance = aws_instance.Lab5.id
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.Lab5.id
  allocation_id = aws_eip.VPC_A_EIP.id
}*/