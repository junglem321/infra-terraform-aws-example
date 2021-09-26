resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "db_mysql" {
  allocated_storage = 5
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"

  name     = "demodb"
  username = var.username
  password = var.password
  port     = "3306"

  iam_database_authentication_enabled = true

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  vpc_security_group_ids = [var.rds_sg_id]

  skip_final_snapshot = true
}
