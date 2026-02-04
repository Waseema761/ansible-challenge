output "frontend_ip" {
  description = "Public IP of frontend (Amazon Linux)"
  value       = aws_instance.frontend.public_ip
}

output "backend_ip" {
  description = "Public IP of backend (Ubuntu)"
  value       = aws_instance.backend.public_ip
}
