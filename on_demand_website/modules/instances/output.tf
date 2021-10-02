output "alb-dns" {
  value = aws_lb.load_balancer.dns_name
  description = "dns of the load balancing to access the instances"
}