terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.63"
    }
    random = {
      version = "~> 3.1"
    }
  }
}
