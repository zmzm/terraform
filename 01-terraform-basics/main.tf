terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # Minimal version
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
