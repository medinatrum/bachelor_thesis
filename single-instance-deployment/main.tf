provider "aws"{
 region = "us-east-2"
 access_key = ""                               
 secret_key = ""                               
}

resource "aws_instance" "terraform"{
 ami = "ami-028dbc12531690cf4"                              
 instance_type = "t2.micro"
 vpc_security_group_ids = [aws_security_group.instance.id]

 user_data = <<-EOF
  #!/bin/bash
               echo "Single web server on AWS successfully deployed!" > index.html
               nohup busybox httpd -f -p ${var.server_port} &
               EOF

 tags = {
  Name = "terraform-example"
 }
}

resource "aws_security_group" "instance"{
 name = "terraform-example-instance"                 

 ingress {
  from_port = var.server_port     
  to_port = var.server_port       
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
}
