# Creating new resource type - iam user
resource "aws_iam_user" "terraform_test_iam_user" {
  # User for specific workspace 
  name = "${terraform.workspace}_iam_user_0129"
}
