variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}

variable "ami_image" {
  default = "ami-050b8344d77081f4b"
}

variable "user_data_script" {
  default = <<EOF
#!/bin/bash
sudo yum install git curl unzip docker-ce -y
EOF
}