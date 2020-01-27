output "clusterName" {
    value = "${aws_ecs_cluster.ecs-cluster.name}"
}

output "region" {
    value = var.region
}

output "subnet" {
    value = var.subnets
}

output "security_group" {
    value = var.security_groups
}