
# Resource definition for the S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-jishnu-hardik-managed-bucket-12345"

  # The 'acl' argument is required and defaults to 'private' in the modern resource.
  # Explicitly setting it is good practice.
  acl = "private" 

  tags = {
    Name        = "JenkinsManagedBucket"
    Environment = "DevOps"
  }
}

# --- Public Access Block Configuration ---
# The arguments for public access block (like block_public_policy) 
# have been moved to a separate 'aws_s3_bucket_public_access_block' resource.
resource "aws_s3_bucket_public_access_block" "example_access_block" {
  bucket = aws_s3_bucket.example_bucket.id
  
  # This argument replaces the 'block_public_policy = true' from the original code.
  block_public_policy = true 

  # Best practice is to set all four public access block settings explicitly.
  block_public_acls       = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Optional: Output the S3 bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.example_bucket.id
}
