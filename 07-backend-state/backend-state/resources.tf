# S3 bucket storage for projects terraform state
resource "aws_s3_bucket" "backend_state" {
  bucket = "dev-applications-backend-state-vladjik-0129"

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
