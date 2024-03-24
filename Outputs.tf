output "instance_ip_addr" {
  value = aws_instance.Lab5.public_ip
}

output "AMI" {
    value = aws_instance.Lab5.ami
}

output "SecurityGroup" {
    value = aws_security_group.SG_lab5.name
}

output "VPC" {
    value = aws_vpc.vpc_lab5.cidr_block
}
