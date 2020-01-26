output "region" {
    value = var.region
}

output "clusterName" {
    value = "${aws_ecs_cluster.ecs-cluster.name}"
}

output "subnet" {
    value = var.subnets
}