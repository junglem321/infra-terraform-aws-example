output "frontend-alb-dns" {
  value = module.frontend-instances.alb-dns
}

output "backend-alb-dns" {
  value = module.backend-instances.alb-dns
}

output "mysql-endpoint" {
  value = module.db_mysql.endpoint
}

output "mysql-port" {
  value = module.db_mysql.port
}