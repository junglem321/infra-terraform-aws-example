output "frontend-alb-dns" {
  value = module.frontend-instances.alb-dns
  description = "dns of the load balancing for the frontend"
}

output "backend-alb-dns" {
  value = module.backend-instances.alb-dns
  description = "dns of the load balancing for the backend"
}

output "mysql-endpoint" {
  value = module.db_mysql.endpoint
  description = "rds mysql endpoint"
}

output "mysql-port" {
  value = module.db_mysql.port
  description = "rds mysql port to use"
}