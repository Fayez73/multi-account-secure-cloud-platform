terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "dev-tf-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "dev-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-2"
}
