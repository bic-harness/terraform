data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = ["LondonVPC"]
  }
}

data "aws_subnet" "selected_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.environment}Subnet"]
  }
}