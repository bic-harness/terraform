variable "access_key" {}

variable "secret_key" {}

variable "green-alb" {}

variable "asg-name" {}

variable "launch_config_name" {}

variable "green-tg-1" {}

variable "green-tg-2" {}

variable "green-listener" {}

variable "region" {
    default= "eu-west-2"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}

variable "ami_image" {
  default = "ami-0b55aac867940e735"
}

/*
variable "blue-alb" {
  default = "blue-alb"
}

variable "blue-tg-1" {
  default = "blue-tg-1"
}

variable "blue-tg-2" {
  default = "blue-tg-2"
}
*/