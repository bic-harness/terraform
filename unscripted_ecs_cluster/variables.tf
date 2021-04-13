variable "access_key" {}

variable "secret_key" {}

variable "environment" {}

variable "region" {
    default= "eu-west-2"
}

variable "security_groups" {
    default = ["sg-01c4818eac2729203"]
}