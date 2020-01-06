output "bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "dynamodb_terraform_state_lock" {
  value = aws_dynamodb_table.tf_state_lock.name
}

output "aws_region" {
  value = var.aws_region
}

output "init_cmd" {
  value = "terraform init -backend-config=\"bucket=${aws_s3_bucket.tf_state.bucket}\" -backend-config=\"dynamodb_table=${aws_dynamodb_table.tf_state_lock.name}\" -backend-config=\"region=${var.aws_region}\" -backend-config=\"profile=${var.aws_profile}\""
}