# terraform-s3-backend-setup
Simple terraform scripts that allow you to setup s3 backend in your new terraform projects quickly. 

## To create your backend
1. Find proper name for your bucket and set it in `s3_bucket_name`. Setup your `aws_profile` and check your region.
2. Remove or backup your previously created `terraform.tfstate`
```
terraform init
terraform apply -var 'aws_region=eu-central-1' -var 'aws_profile=default' -var 's3_bucket_name=s3-for-tf'
```
3. Use `init_cmd` output value to init your new terraform project.