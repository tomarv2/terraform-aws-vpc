data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.29"

  name = local.prefix
  cidr = var.cidr_block
  azs  = data.aws_availability_zones.available.names
  tags = merge(local.shared_tags)

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  create_igw           = true

  public_subnets  = [cidrsubnet(var.cidr_block, 3, 0)]
  private_subnets = [cidrsubnet(var.cidr_block, 3, 1),
                     cidrsubnet(var.cidr_block, 3, 2)]

  default_security_group_egress = [{
    cidr_blocks = "0.0.0.0/0"
  }]

  default_security_group_ingress = [{
    description = "Allow all internal TCP and UDP"
    self        = true
  }]
}

