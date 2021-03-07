variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}

variable "ami_image" {
  default = "ami-0a0cb6c7bcb2e4c51"
}

variable "blue-alb" {
  defualt = "blue-alb"
}

variable "green-alb" {
  default = "green-alb"
}

variable "asg-name" {
  default = "asg-name"
}

variable "launch_config_name" {
  default = "lc-name"
}

variable "green-tg" {
  default = "green-tg"
}

variable "blue-tg" {
  default = "blue-tg"
}