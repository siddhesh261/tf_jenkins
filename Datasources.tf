data "aws_ami" "amz_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240306.2-x86_64-gp2"]
         }
 }

  
