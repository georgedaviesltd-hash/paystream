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

data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_instance" "kubernetes_host" {
  ami                         = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type               = "t3.micro" 
  subnet_id                   = aws_subnet.public.id 
  vpc_security_group_ids      = [aws_security_group.paystream_sg.id]
  associate_public_ip_address = true

  # FIX: Configures the internal Linux firewall to allow instant web dashboard exposure
  user_data = <<-EOF
              #!/bin/bash
              # Turn off local system firewall blocks to open communication paths
              ufw disable
              iptables -F
              
              # Pull and install the live k3s orchestration container layer
              curl -sfL https://k3s.io | sh -
              
              # Force spin up a standalone container service fallback routing straight to port 80
              docker run -d -p 80:80 --name fallback-view nginx
              EOF

  tags = {
    Name = "paystream-free-kubernetes-node"
  }
}
