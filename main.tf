terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "tf_state" {
    bucket = var.s3_bucket_name
    acl    = "private"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
    tags = {
      Name = "S3 bucket for storing terraform state"
    }      
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name = "tf-state-lock-${var.s3_bucket_name}"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  # read_capacity = 20
  # write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB table for locking terraform state"
  }
}