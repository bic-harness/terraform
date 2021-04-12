data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}VPC"]
  }
}

data "aws_subnet_ids" "selected_subnets" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}Subnet"]
  }
}