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

variable "blue-elb" {
  defualt = "blue-elb"
}

variable "green-elb" {
  default = "green-elb"
}