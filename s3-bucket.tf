# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  # You can specify a region, or let it default based on environment variables
  region = "us-east-1"
}

# Resource definition for the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-jishnu-jenkins-managed-bucket-12345"
  force_destroy = true
  
  tags = {
    Name        = "JenkinsManagedBucket"
    Environment = "DevOps"
  }
}

# Optional: Output the S3 bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.example_bucket.id
}
