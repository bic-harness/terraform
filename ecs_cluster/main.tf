

resource "aws_ecs_cluster" "ecs-cluster" {
    name = var.ecs-cluster-name

}

  resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "ecs-asg-${var.ecs-cluster-name}"
    max_size                    = "3"
    min_size                    = "1"
    desired_capacity            = var.capacity
    vpc_zone_identifier         = var.subnets
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ELB"
  }
  resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "ecs-lb-${var.ecs-cluster-name}"
    image_id                    = "ami-0e4249602c03f799a"
    instance_type               = "m5d.large"
    iam_instance_profile        = "ECSRoleForEC2"
    root_block_device {
      volume_type = "standard"
      volume_size = 30
      delete_on_termination = true
    }
    lifecycle {
      create_before_destroy = true
    }
    security_groups             = var.security_groups
    associate_public_ip_address = "true"
    key_name                    = "bc-harness"
    user_data                   = "#!/bin/bash\necho ECS_CLUSTER='${var.ecs-cluster-name}' > /etc/ecs/ecs.config"
  }