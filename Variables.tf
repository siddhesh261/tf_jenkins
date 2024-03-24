variable "instance-type" {
    type= string
    default = "t2.micro"
}

variable "key" {
    type= string
    default = "terra1"
}

variable "vpc_cidr" {
    type= string
    default = "172.16.0.0/16"
}

variable "subnet_cidr" {
    type= string
    default = "172.16.10.0/24"
}

variable "region" {
    type= string
    default = "us-east-1a"
}

variable "security" {
    type=string
    default = "SG_lab5"
}