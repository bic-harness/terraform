terraform {
   backend "s3" {
   bucket = "bic-harness"
   key = "terraform-apigw-lambda.tfstate"
   region = "eu-west-2"
  }
}