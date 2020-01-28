variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "ecs-cluster-name" {}

variable "capacity" {
  default = "2"
  }

variable "subnets" {
    default = ["subnet-8abbfee3"]
}

variable "security_groups" {
    default = ["sg-22358043"]
}