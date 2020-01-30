variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default= "eu-west-2"
}

variable "ami_image" {
  default = ""
}

variable "user_data_script" {
  default = <<EOF
#!/bin/bash
yum install httpd git curl unzip -y
curl -O -L https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
chmod 777 terraform_0.12.20_linux_amd64.zip
unzip terraform_0.12.20_linux_amd64.zip
sudo mv terraform /bin/ -f
terraform --version
aws s3 cp s3://bic-harness/docker_hello_world.zip /home/ec2-user/
EOF
}