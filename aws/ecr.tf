resource "aws_ecr_repository" "this" {
  name                 = var.project_name
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.project_name}-ecr"
  }
}

resource "terraform_data" "push_images" {
  depends_on = [aws_ecr_repository.this]

  provisioner "local-exec" {
    command = <<EOT
      # Authenticate Docker with ECR using the specified AWS CLI profile
      docker logout
      aws ecr get-login-password --region ${var.region} --profile ${var.profile} | docker login --username AWS --password-stdin ${aws_ecr_repository.this.repository_url}

      # Build and push image (eks-demo-php)
      cd ../php
      docker build -t eks-demo-php:latest .
      docker tag eks-demo-php:latest ${aws_ecr_repository.this.repository_url}:eks-demo-php
      docker push ${aws_ecr_repository.this.repository_url}:eks-demo-php
    EOT
  }
}