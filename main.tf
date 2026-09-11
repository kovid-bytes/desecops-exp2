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

# 1. Secured S3 Bucket
resource "aws_s3_bucket" "devsecops_bucket" {
  bucket        = "devsecops-iac-demo-bucket-2025"
  force_destroy = true

  tags = {
    Name        = "DevSecOps Secured Lab Bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

# 2. Security Control: Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.devsecops_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 3. Security Control: Enable Bucket Versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.devsecops_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# 4. Security Control: Block All Public Access
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.devsecops_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
