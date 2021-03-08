output "region" {
    value = var.region
}

output "asg_name" {
    value = var.asg-name
}

output "blue_alb" {
//    value = var.blue-alb
    value = aws_lb.blue_lb.arn
}

output "green_alb" {
//    value = var.green-alb
    value = aws_lb.green_lb.arn
}

output "green_tg_1" {
    value = aws_lb_target_group.green_tg_1.arn
}

output "green_tg_2" {
    value = aws_lb_target_group.green_tg_2.arn
}

output "blue_tg_1" {
    value = aws_lb_target_group.blue_tg_1.arn
}

output "blue_tg_2" {
    value = aws_lb_target_group.blue_tg_2.arn
}

output "green_listener" {
    value = aws_lb_listener.green_listener.arn
}

output "blue_listener" {
    value = aws_lb_listener.blue_listener.arn
}