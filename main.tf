terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

resource "aws_s3_bucket" "devsecops_bucket" {
  bucket = "devsecops-iac-demo-bucket-2025"

  tags = {
    Name        = "DevSecOps Lab Bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
