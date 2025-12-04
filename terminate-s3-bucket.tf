resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-jishnu-hardik-managed-bucket-2025"

  # Setting this to true allows Terraform to empty the bucket contents
  # before deleting the bucket on 'terraform destroy'.
  force_destroy = true 

  # ... other bucket config (versioning, public access block, etc.)
}
