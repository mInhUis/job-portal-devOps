
variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "ap_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}
variable "ec2_ami_id" {
  type  =string
  description = "ec2 ami id"
}

variable "public_key" {
  type = string
  description = "Publickey  Jenkins instance"
}

variable "ec2_user_data_install_apache" {
  type = string
  description = "Script for installing the Apache2"
}

variable "domain_name" {
  type = string
  description = "Name of the domain"
}