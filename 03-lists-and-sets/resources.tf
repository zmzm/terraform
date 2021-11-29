# Creating multiple iam users
resource "aws_iam_user" "terraform_test_iam_users" {
  for_each = var.names
  name     = each.value
}
