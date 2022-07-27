terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.23"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../"

  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  create_igw             = true
  default_security_group_egress = [{
    cidr_blocks = "0.0.0.0/0"
  }]

  default_security_group_ingress = [{
    description = "Allow all internal TCP and UDP"
    self        = true
  }]
  public_subnets  = [cidrsubnet(var.cidr_block, 3, 0)]
  private_subnets = [cidrsubnet(var.cidr_block, 3, 1)]

  custom_tags = {
    "hello": "world"
  }
  #------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
