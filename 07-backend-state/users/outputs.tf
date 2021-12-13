# After resource creation, you can output any valuable information into the console.
output "my_iam_user_complete_details" {
  value = aws_iam_user.terraform_test_iam_user
}
