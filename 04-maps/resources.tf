# Creating multiple iam users
resource "aws_iam_user" "terraform_test_iam_users" {
  for_each = var.users_map
  name     = each.key
  tags = {
    country    = each.value.country
    department = each.value.department
  }
}
