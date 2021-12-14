# After resource creation, you can output any valuable information into the console.
output "aws_iam_user_details" {
  value = aws_iam_user.my_iam_user
}
