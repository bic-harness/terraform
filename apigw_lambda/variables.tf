variable "access_key" {}

variable "secret_key" {}

variable "account_id" {}

variable "lambda_name" {}

variable "rest_api_name" {}

variable "region" {
    default= "eu-west-2"
}

variable "method" {
  description = "The HTTP method"
  default     = "GET"
}

variable "path" {
  description = "The API resource path"
  default ="*"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}