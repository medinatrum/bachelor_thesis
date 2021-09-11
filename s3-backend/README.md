Terraform commands for creating one EC2 instance in three different workspaces (before S3 backend configuration):

terraform init 

terraform plan 

terraform apply 


After S3 backend configuration:

terraform init -backend-config="access_key=..." -backend-config="secret_key=..."

terraform apply


Switch to workspace1:

terraform workspace new workspace1

+ all commands from default workspace 


Switch to workspace2:

terraform workspace new workspace2

+ same commands from default workspace


To switch between workspaces:

terraform workspace select workspace1

terraform destroy in every workspace (to destroy all resources)



