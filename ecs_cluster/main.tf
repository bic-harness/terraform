

resource "aws_ecs_cluster" "ecs-cluster" {
    name = var.ecs-cluster-name

}

  resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "ecs-asg-${var.ecs-cluster-name}"
    max_size                    = "4"
    min_size                    = "1"
    desired_capacity            = var.capacity
    vpc_zone_identifier         = ["subnet-8abbfee3","subnet-d7b2659b"]
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ELB"
  }
  resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "ecs-lb-${var.ecs-cluster-name}"
    image_id                    = "ami-0089b31e09ac3fffc"
    instance_type               = "t2.medium"
    iam_instance_profile        = "ECSRoleForEC2"
    root_block_device {
      volume_type = "standard"
      volume_size = 20
      delete_on_termination = true
    }
    lifecycle {
      create_before_destroy = true
    }
    security_groups             = ["sg-22358043"]
    associate_public_ip_address = "true"
    key_name                    = "bc-harness"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs-cluster-name} >> /etc/ecs/ecs.config
                                  EOF
}