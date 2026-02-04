provider "aws" {
  region = var.region
}

########################################
# FRONTEND – Amazon Linux (c8.local)
########################################
resource "aws_instance" "frontend" {
  ami           = "ami-0532be01f26a3de55" # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "c8.local"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname c8.local
              EOF
}

########################################
# BACKEND – Ubuntu 21.04 (u21.local)
########################################
resource "aws_instance" "backend" {
  ami           = "ami-0b6c6ebed2801a5cb" # Ubuntu 21.04 (us-east-1)
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "u21.local"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname u21.local
              EOF
}
########################################
# Generate Ansible Inventory
########################################
resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"

  content = templatefile("${path.module}/inventory.tpl", {
    frontend_ip = aws_instance.frontend.public_ip
    backend_ip  = aws_instance.backend.public_ip
  })
}

