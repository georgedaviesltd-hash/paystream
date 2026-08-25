output "public_site_url" {
  value       = "http://${aws_instance.kubernetes_host.public_ip}"
  description = "The absolute public live link endpoint for your PayStream application review"
}

output "ecr_frontend_url" {
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecr_payment_url" {
  value       = aws_ecr_repository.payment_service.repository_url
}
