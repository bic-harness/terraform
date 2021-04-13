data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}VPC"]
  }
}

data "aws_subnet_ids" "selected_subnets" {

  vpc_id = data.selected._vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.environment}Subnet"]
  }
}