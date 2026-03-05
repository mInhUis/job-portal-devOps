variable "ec2_sg_name" {}
variable "ec2_jenkins_name" {}
variable "vpc_id" {}
variable "public_subnet_cidr_block" {}
variable "ec2_sg_name_for_python_api" {}

output "sg_ec2_sg_ssh_http_id" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

output "sg_ec2_for_python_api" {
  value = aws_security_group.ec2_sg_python_api.id
}

output "sg_jenkins_id" {
  value = aws_security_group.sg_jenkins_port_8080.id
}

resource "aws_security_group" "sg_jenkins_port_8080" {
    name = var.ec2_jenkins_name
    description = "Enable the Port 8080(jenkins)"
    vpc_id = var.vpc_id
    ingress {
        description = "Allow remote SSH from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
    }

      tags = {
        Name = "Security Groups to allow 8080"
    }
}

resource "aws_security_group" "ec2_sg_ssh_http" {
  name        = var.ec2_sg_name
  description = "Enable the Port 22(SSH) & Port 80(http)"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow remote SSH from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

resource "aws_security_group" "ec2_sg_python_api" {
  name        = var.ec2_sg_name_for_python_api
  description = "Enable the Port 5000 for python api"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow traffic on port 5000"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
  }

  tags = {
    Name = "Security Groups to allow traffic on port 5000"
  }
}