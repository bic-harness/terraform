locals {
 isProd = var.environment == "Prod" ? true : false 
}

module "vpc" {
  source = "github.com/bic-harness/terraform-aws-vpc"

  name = "${var.environment}VPC"

  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = local.isProd ? ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] : []

  enable_ipv6 = true

  enable_nat_gateway = local.isProd ? true : false
  single_nat_gateway = local.isProd ? true : false

  enable_s3_endpoint       = false
  enable_dynamodb_endpoint = false

  public_subnet_tags = {
    Environment = "${var.environment}"
    Type        = "Public"
  }

  tags = {
    Environment = "${var.environment}"
  }

  vpc_tags = {
    Name = "${var.environment}VPC"
  }
}

resource "aws_instance" "docker_host" {
  ami                    = "ami-0a0cb6c7bcb2e4c51"
  instance_type          = "t2.micro"
  key_name               = "bc-harness"
  vpc_security_group_ids = ["sg-01c4818eac2729203"]
  
  tags = {
    Name        = "Sample Host"
  }
}

