# Creating multiple iam users
resource "aws_iam_user" "terraform_test_iam_users" {
  count = length(var.names)
  name  = var.names[count.index]
}
