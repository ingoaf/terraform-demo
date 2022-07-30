resource "aws_s3_bucket" "terraform-demo" {
  bucket = "terraform-demo-test"
  acl    = "private"

  tags = {
    Name        = "terraform-demo"
    Environment = "dev"
  }
}

# Optional: restrict public access
resource "aws_s3_bucket_public_access_block" "terraform-demo" {
  bucket = aws_s3_bucket.terraform-demo.id
  block_public_acls = true
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.terraform-demo.id
  key    = "test"
  source = "terraform-demo.pdf"
}