# Creating first test resource (AWS S3 bucket)
resource "aws_s3_bucket" "terraform_test_bucket" {
  bucket = "terraform-test-bucket-vladjik-0129"
  versioning {
    enabled = true
  }
}

# Creating new resource type - iam user
resource "aws_iam_user" "terraform_test_iam_user" {
  name = "terraform_test_iam_user_0129"
}
