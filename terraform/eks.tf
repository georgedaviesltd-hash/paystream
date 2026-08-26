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
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Fetch the absolute latest, verified Free-Tier eligible Ubuntu 24.04 LTS AMI automatically
data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

# Provision a single Free-Tier eligible compute instance running k3s
resource "aws_instance" "kubernetes_host" {
  ami                         = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type               = "t3.micro" 
  subnet_id                   = aws_subnet.public.id # FIX: Removed the [0] brackets since it is a single subnet resource
  vpc_security_group_ids      = [aws_security_group.paystream_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              curl -sfL https://k3s.io | sh -
              EOF

  tags = {
    Name = "paystream-free-kubernetes-node"
  }
}
