output "region" {
    value = var.region
}

output "asg_name" {
    value = var.asg-name
}

output "blue_alb" {
    value = var.blue-alb
}

output "green_alb" {
    value = var.green-alb
}

output "green_tg" {
    value = aws_lb_target_group.green_tg.arn
}

output "blue_tg" {
    value = aws_lb_target_group.blue_tg.arn
}

output "green_listener" {
    value = aws_listener.green_listener.arn
}