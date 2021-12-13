variable "aws_S3_backed_state_bucket_name" {
  type        = string
  default     = "dev-applications-backend-state-vladjik-0129"
  description = "S3 bucket for storing applications backend state"
}

variable "aws_backend_state_lock_db_name" {
  type        = string
  default     = "dev_applications_backend_lock"
  description = "DynamoDB for locking backend state"
}
