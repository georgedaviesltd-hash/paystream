output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC network identification block ID"
}

output "eks_cluster_endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "EKS Cluster API cluster control node string link"
}

output "ecr_frontend_url" {
  value       = aws_ecr_repository.frontend.repository_url
  description = "Storage path url block for the frontend react registry layer"
}

output "ecr_payment_url" {
  value       = aws_ecr_repository.payment_service.repository_url
  description = "Storage path url block for the payment backend registry layer"
}

output "ecr_notification_url" {
  value       = aws_ecr_repository.notification_service.repository_url
  description = "Storage path url block for the notification node registry layer"
}
