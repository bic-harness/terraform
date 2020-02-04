variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "primary_zone_id" {
  default = "Z1PSCTOWTFWDHX"
}

variable "ami_image" {
  default = "ami-0089b31e09ac3fffc"
}

variable "user_data_script" {
  default = <<EOF
#!/bin/bash
sudo yum install httpd git curl unzip -y
sudo systemctl enable httpd
sudo systemctl start httpd
EOF
}