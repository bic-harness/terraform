
resource "aws_ecs_cluster" "ecs-cluster" {
    name = "${var.environment}ECSCluster"
}

resource "aws_lb" "main_lb" {
  load_balancer_type = "application"
  name               = "${var.environment}ALB"
  subnets            = data.selected_subnets.ids
}

resource "aws_lb_target_group" "main_tg" {
  name          = "${var.environment}ALB-tg"
  port          = 80
  protocol      = "HTTP"
  target_type   = "instance"
  vpc_id        = data.selected_vpc.id
  stickiness {
      type = "lb_cookie"
      enabled = true
      cookie_duration = 1
  }
}

resource "aws_lb_listener" "main_listener" {
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
  listener_arn = aws_lb_listener.main_listener.arn

  action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.main_tg.arn
        weight = 100
      }
      stickiness {
        enabled  = true
        duration = 1
      }
    }
  }

  condition {
    host_header {
      values = ["*.*.*"]
    }
  }
}