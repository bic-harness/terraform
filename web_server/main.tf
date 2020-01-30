resource "aws_instance" "web_server" {
  ami             = var.ami_image
  instance_type   = "t2.micro"
  user_data       = var.user_data_script
  key_name        = "bc-harness"
  security_groups = ["sg-01c4818eac2729203"]
  
  tags = {
    Name        = "Web Server"
    Environment = "Production"
  }
}