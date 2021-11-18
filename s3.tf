resource "aws_s3_bucket" "terraform-demo" {
  bucket = "terraform-demo-test"
  acl    = "private"

  tags = {
    Name        = "terraform-demo"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.terraform-demo.id
  key    = "test"
  source = "terraform-demo.pdf"
}