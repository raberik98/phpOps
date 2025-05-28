variable "region" {
  description = "Region for the provider"
  type = string
  default = "eu-central-1"
}

variable "profile" {
  description = "Profile for the region, likely the profile will assume a role"
  type = string
  default = "g-36"
}

variable "project_name" {
  description = "This value will be used as a tag for the related AWS resources!"
  type = string
}

terraform {
  required_version = ">= 1.3.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.95"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "aws" {
  region = var.region
  profile = var.profile
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

output "ecr_repository_url" {
  value = "${aws_ecr_repository.this.repository_url}:eks-demo-php"
}