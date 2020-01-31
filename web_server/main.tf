resource "aws_instance" "web_server" {
  ami                    = var.ami_image
  instance_type          = "t2.micro"
  user_data              = ${file("startup.sh")}
  key_name               = "bc-harness"
  vpc_security_group_ids = ["sg-01c4818eac2729203"]
  
  tags = {
    Name        = "WebServer"
    Environment = "Production"
  }
}