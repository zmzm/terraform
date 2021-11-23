terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # Minimal version
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

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

# After resource creation, you can output any valuable information into the console.
output "terraform_test_bucket_remote_id" {
  value = aws_s3_bucket.terraform_test_bucket.id
}
