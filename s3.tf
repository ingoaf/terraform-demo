resource "aws_s3_bucket" "terraform-demo" {
  bucket = "terraform-demo-test"

  tags = {
    Name        = "terraform-demo"
    Environment = "dev"
  }
}

# Optional: restrict public access
resource "aws_s3_bucket_public_access_block" "terraform-demo" {
  bucket                  = aws_s3_bucket.terraform-demo.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Optional: encrypt the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.terraform-demo.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.terraform-demo.id
  key    = "test"
  source = "terraform-demo.pdf"
}