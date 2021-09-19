provider "aws" {
 region = "us-east-2"
 access_key = ""                   
 secret_key = ""                    

}

resource "aws_db_instance" "example" {
 identifier_prefix = "zavrsni-rad"                            
 engine = "mysql"
 allocated_storage = 10
 instance_class = "db.t2.micro"
 name = var.db_name                 
 username = "medina"      
                               
 skip_final_snapshot = true    
 password = var.db_password
}

terraform {
 backend "s3" {
 bucket = "diplomski-rad-terraform-state"                                   
 key = "stage/data-stores/mysql/terraform.tfstate"
 region = "us-east-2"
 dynamodb_table = "terraform-locks"                            
 encrypt = true
 }
}
