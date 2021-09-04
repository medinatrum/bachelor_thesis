output "domain-name" {
  value = aws_instance.terraform.public_dns
}

output "application-url" {
  value = "${aws_instance.terraform.public_dns}/index.php"
}

output "public_ip"{
value=aws_instance.terraform.public_ip
description="The public IP address of the web server"
}
