resource "aws_security_group" "pulsar_sg" {
  name                    = "pulsar-sg-${var.env}"
  description             = "Allow pulsar traffic"
  vpc_id                  = var.vpc_id

  ingress {
    from_port             = 22
    to_port               = 22
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  ingress {
    from_port             = 0
    to_port               = 0
    protocol              = "-1"
    self                  = true
  }

  ingress {
    from_port             = 6650
    to_port               = 6650
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  ingress {
    from_port             = 8080
    to_port               = 8080
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  egress {
    from_port             = 0
    to_port               = 0
    protocol              = "-1"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  tags                    = {
    Name                  = "pulsar-sg-${var.env}"
    Env                   = var.env
    Owner                 = "Terraform"
  }
}