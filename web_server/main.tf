resource "aws_instance" "web_server" {
  ami           = var.ami_image
  instance_type = "t2.micro"
  user_data     = var.user_data_script
}
  
  tags = {
    Name        = "Web Server"
    Environment = "Production"
  }
}