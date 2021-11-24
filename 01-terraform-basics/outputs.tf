# After resource creation, you can output any valuable information into the console.
output "terraform_test_bucket_remote_id" {
  value = aws_s3_bucket.terraform_test_bucket.id
}
