output "alb-dns" {
  value = aws_lb.load_balancer.dns_name
}