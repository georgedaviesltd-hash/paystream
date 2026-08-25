variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The target AWS cloud region for all PayStream resources"
}

variable "cluster_name" {
  type        = string
  default     = "paystream-eks-cluster"
  description = "The unique identification name for our managed Kubernetes engine"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The foundational private network address block allocation"
}
