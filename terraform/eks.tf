# Security Group to allow public web access to our application
resource "aws_security_group" "paystream_sg" {
  name        = "paystream-free-tier-sg"
  description = "Allow inbound web and service communication"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For secure debugging access if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Provision a single Free-Tier eligible compute instance running k3s
resource "aws_instance" "kubernetes_host" {
  ami                         = "ami-0c7217cdde317cfec" # Official Ubuntu LTS Minimal AMI for us-east-1
  instance_type               = "t2.micro" # 100% Free-Tier Eligible Compute Slot
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.paystream_sg.id]
  associate_public_ip_address = true

  # Bootstrap script to instantly spin up an lightweight local Kubernetes engine
  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://k3s.io | sh -
              EOF

  tags = {
    Name = "paystream-free-kubernetes-node"
  }
}
