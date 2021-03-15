terraform {
   backend "s3" {
   bucket = "bic-harness"
   key = "terraform-ami-${var.green-alb}.tfstate"
   region = "eu-west-2"
  }
}