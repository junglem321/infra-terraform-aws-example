# Frontend security groups
resource "aws_security_group" "alb_sg_fe" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "alb-fe"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "instance_fe" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "instance-fe"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_ip_host]
  }

  ingress {
    from_port = var.app_port_fe
    to_port   = var.app_port_fe
    protocol  = "tcp"

    security_groups = [aws_security_group.alb_sg_fe.id]
  }
}


# Backend SG
resource "aws_security_group" "alb_sg_be" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "alb-be"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    # security_groups = [aws_security_group.instance_fe.id] # private link... (https://aws.amazon.com/elasticloadbalancing/faqs/)
  }
}


resource "aws_security_group" "instance_be" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "instance-be"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_ip_host]
  }

  ingress {
    from_port = var.app_port_be
    to_port   = var.app_port_be
    protocol  = "tcp"

    security_groups = [aws_security_group.alb_sg_be.id]
  }
}

# database
resource "aws_security_group" "mysql" {
  vpc_id      = module.vpc.vpc_id
  name_prefix = "alb-be"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"

    security_groups = [aws_security_group.instance_be.id]
  }
}