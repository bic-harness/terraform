variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}

variable "ami_image" {
  default = "ami-0b55aac867940e735"
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

variable "green-tg-1" {
  default = "green-tg-1"
}

variable "green-tg-2" {
  default = "green-tg-2"
}

variable "green-listener" {
  default = "green-listener"
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