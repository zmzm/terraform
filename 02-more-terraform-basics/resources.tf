# Creating multiple iam users
resource "aws_iam_user" "terraform_test_iam_users" {
  count = 2
  name  = "terraform_test_iam_user_${count.index}"
}
