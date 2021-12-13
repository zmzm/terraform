# S3 bucket storage for projects terraform state
resource "aws_s3_bucket" "backend_state" {
  bucket = var.aws_S3_backed_state_bucket_name

  versioning {
    enabled = true
  }

  # Prevent accidental destroy of resource
  lifecycle {
    prevent_destroy = true
  }

  # Data encryption 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "backend_lock" {
  name         = var.aws_backend_state_lock_db_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
