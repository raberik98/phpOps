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
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}