variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "ami_image" {
  default = "ami-0089b31e09ac3fffc"
}

variable "user_data_script" {
  default = <<EOF
#!/bin/bash
yum install httpd git curl unzip -y
systemctl enable httpd
systemctl start httpd
EOF
}