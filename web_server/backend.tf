terraform {
   backend "s3" {
   bucket = "bic-harness"
   key = "terraform-web-servertfstate"
   region = "eu-west-2"
  }
}