resource "aws_launch_configuration" "bg-launch-config" {
  name                        = var.launch_config_name
  image_id                    = var.ami_image
  instance_type               = "t2.micro"
  security_groups             = ["sg-01c4818eac2729203"]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-config" {
  name                 = var.asg-name
  min_size             = 1
  desired_capacity     = 1
  max_size             = 3
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.bg-launch-config.name
  vpc_zone_identifier  = ["subnet-8abbfee3"]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "application" {
  name    = var.blue-alb
  subnets = ["subnet-8abbfee3"]
 
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
 
}

resource "aws_lb_target_group" "green_tg" {
  name     = var.green-tg
  port     = 80
  protocol = "HTTP"
}

resource "aws_lb_target_group" "blue_tg" {
  name     = var.blue-tg
  port     = 8080
  protocol = "HTTP"
}
 
resource "aws_route53_record" "application" {
  zone_id = var.primary_zone_id
  name    = "application.bicatana.net"
  type    = "A"
 
  alias {
    name                   = aws_elb.application.dns_name
    zone_id                = aws_elb.application.zone_id
    evaluate_target_health = true
  }
 
  weighted_routing_policy {
    weight = 10
  }
 
  set_identifier = "blue"
}
 
resource "aws_elb" "application_green" {
  name    = var.green-alb
  subnets = ["subnet-8abbfee3"]
 
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}
 
resource "aws_route53_record" "application_green" {
  zone_id = var.primary_zone_id
  name    = "application.bicatana.net"
  type    = "A"
 
  alias {
    name                   = aws_elb.application_green.0.dns_name
    zone_id                = aws_elb.application_green.0.zone_id
    evaluate_target_health = true
  }
 
  weighted_routing_policy {
    weight = 0
  }
 
  set_identifier = "green"
}