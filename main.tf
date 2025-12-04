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


terraform {
  backend "s3" {
    bucket        = "terraform-backend-jishnuhardik-s3-bucket"
    key           = "terraform_state"
    region        = "us-east-1"

    # New flag to enable S3 native locking
    use_lockfile  = true
  }
}
