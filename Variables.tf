variable "instance-type" {
    type= string
    /*default = "t2.micro"*/
    default = "type"
}

variable "key" {
    type= string
    default = "key"
}

variable "vpc_cidr" {
    type= string
    default = "cidr"
}

variable "subnet_cidr" {
    type= string
    default = "cidr"
}

variable "region" {
    type= string
    default = "region"
}

variable "security" {
    type=string
    default = "Security"
}