terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3, < 4"
    }
  }

  required_version = ">= 1.0"
}

# Initialize providers

provider "aws" {
  region = var.region
}

data "aws_region" "current" {

}

data "aws_availability_zones" "available" {

}

# initialize vpc
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.6.0"

  name = "main - VPC"
  cidr = "10.1.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.1.11.0/24", "10.1.13.0/24"]
  public_subnets  = ["10.1.1.0/24", "10.1.3.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    "Name" = "infra-terraform-demo"
  }
}

module "frontend-instances" {
  source = "./modules/instances"
  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets
  ssh_ip_host    = var.ssh_ip_host

  # define security groups id
  alb_sg_id      = aws_security_group.alb_sg_fe.id
  instance_sg_id = aws_security_group.instance_fe.id

  desired_capacity = var.desired_capacity_fe
  max_size         = var.max_size_fe
  min_size         = var.min_size_fe

  app_port = var.app_port_fe

  public_key_name    = aws_key_pair.mykeypair.key_name
  template_file_path = "scripts/ubuntu-fe-init.sh"

  target_dns  = module.backend-instances.alb-dns
  target_port = 80
}

module "backend-instances" {
  source = "./modules/instances"
  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets
  ssh_ip_host    = var.ssh_ip_host

  # define security groups id
  instance_sg_id = aws_security_group.instance_be.id
  alb_sg_id      = aws_security_group.alb_sg_be.id

  desired_capacity = var.desired_capacity_be
  max_size         = var.max_size_be
  min_size         = var.min_size_be

  app_port = var.app_port_be

  public_key_name    = aws_key_pair.mykeypair.key_name
  template_file_path = "scripts/ubuntu-be-init.sh"

  target_dns  = module.db_mysql.endpoint
  target_port = module.db_mysql.port
}

module "db_mysql" {
  source          = "./modules/database"
  private_subnets = module.vpc.private_subnets

  username = var.username
  password = var.password

  rds_sg_id = aws_security_group.mysql.id
}

# keypair
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair2"
  public_key = file(var.path_to_public_key)
  lifecycle {
    ignore_changes = [public_key]
  }
}