variable "access_key" {}

variable "secret_key" {}

variable "lambda_name" {}

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

variable "account_id" {
  description = "The AWS account ID"
  default     = ""
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}