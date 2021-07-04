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

resource "aws_eip" "docker_eip" {
  instance = aws_instance.docker_host.id
  vpc      = true
}

resource "aws_route53_record" "harnessu" {
  zone_id = var.primary_zone_id
  name    = "harnessu.bicatana.net"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.docker_eip.public_ip}"]
}

