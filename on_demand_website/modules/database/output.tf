output "endpoint" {
  value = aws_db_instance.db_mysql.endpoint
  description = "rds mysql endpoint"
}

output "port" {
  value = aws_db_instance.db_mysql.port
  description = "rds mysql port to use"
}