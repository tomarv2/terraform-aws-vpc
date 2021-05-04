terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      version = "~> 3.30"
    }
    random = {
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile_to_use
}
