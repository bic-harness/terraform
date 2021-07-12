resource "aws_instance" "docker_host" {
  ami                    = var.ami_image
  instance_type          = "t2.micro"
  key_name               = "harnessu"
  vpc_security_group_ids = ["sg-01c4818eac2729203"]
  
  tags = {
    Name        = "DockerHost"
    Environment = "HarnessU Staging"
  }
}