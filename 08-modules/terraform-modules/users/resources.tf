# Creating new resource type - iam user
resource "aws_iam_user" "my_iam_user" {
  name = "iam_user_0129_${var.environment}"
}
