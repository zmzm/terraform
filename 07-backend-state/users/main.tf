terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # Minimal version
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "dev-applications-backend-state-vladjik-0129"
    key            = "07-backend-state-users-dev"
    region         = "us-east-1"
    dynamodb_table = "dev_applications_backend_lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
