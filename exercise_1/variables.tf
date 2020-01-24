variable "access_key" {}
variable "secret_key" {}

variable "region" {
  description = "AWS Region required by Terraform AWS Provider"
  default     = "eu-west-2"
  }

variable "s3_bucket_region" {
  description = "Region where S3 bucket will be created used to store remote state file"
  default     = "eu-west-2"
  }

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to be created used to store the remote state file"
  default     = "rc-tf-bucket-training-exersise-1"
  }

variable "tag_env" {
  description = "Tag for Environment Name"
  default     = "training"
  }
