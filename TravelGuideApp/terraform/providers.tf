locals {
  cross_account_role_arn = "arn:aws:iam::412999873787:role/terraform_asume" # for security reason I delete it
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.provider_region
  assume_role {
    role_arn = "arn:aws:iam::412999873787:role/terraform_asume"
  }
}
