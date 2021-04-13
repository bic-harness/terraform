locals {
 isProd = var.environment == "Prod" ? true : false 
}


resource "aws_ecs_cluster" "ecs-cluster" {
    name = "${var.environment}ECSCluster"
}

resource "aws_lb" "main_lb" {
  count              = local.isProd ? 1 : 0
  load_balancer_type = "application"
  name               = "${var.environment}ALB"
  subnets            = data.aws_subnet_ids.selected_subnets.ids
}

resource "aws_lb_target_group" "main_tg" {
  count         = local.isProd ? 1 : 0
  name          = "${var.environment}ALB-tg"
  port          = 80
  protocol      = "HTTP"
  target_type   = "instance"
  vpc_id        = data.aws_vpc.selected_vpc.id
  stickiness {
      type = "lb_cookie"
      enabled = true
      cookie_duration = 1
  }
}

resource "aws_lb_listener" "main_listener" {
  count             = local.isProd ? 1 : 0
  load_balancer_arn = aws_lb.main_lb.arn

  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    forward {
        stickiness {
            enabled = true
            duration = 1
        }
        target_group {
          arn = aws_lb_target_group.main_tg.arn
          weight = 100
        }
    }
  }
}

resource "aws_lb_listener_rule" "main_listener_rule" {
  count        = local.isProd ? 1 : 0
  listener_arn = aws_lb_listener.main_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_tg.arn
  }

  condition {
    host_header {
      values = ["*.*.*"]
    }
  }
}