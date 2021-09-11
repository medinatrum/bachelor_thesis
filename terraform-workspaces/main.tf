provider "aws" {
 region = "us-east-2"
 access_key = ""                               
 secret_key = ""                               
}

resource "aws_instance" "terraform" {
 ami = "ami-028dbc12531690cf4"                              
 instance_type = "t2.micro"

 tags = {
  Name = "terraform-example"
 }
}

resource "aws_s3_bucket" "terraform_state" {
 bucket= var.bucket_name

 force_destroy = true

 versioning {
  enabled = true
 }

 server_side_encryption_configuration {
  rule {
   apply_server_side_encryption_by_default {
   sse_algorithm = "AES256"
   }
  }
 }
}

resource "aws_dynamodb_table" "terraform_locks" {
 name = var.table_name   
 billing_mode = "PAY_PER_REQUEST"
 hash_key = "LockID"

 attribute {
  name = "LockID"
  type = "S"
 }
}

terraform {
 backend "s3" {
 bucket = "diplomski-rad-terraform-state"
 key = "workspaces-example/terraform.tfstate"
 region = "us-east-2"

 dynamodb_table = "terraform-locks"
 encrypt = true
 }
}
