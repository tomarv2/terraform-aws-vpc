data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.5.0"

  name = "${var.teamid}-${var.prjid}"
  cidr = var.cidr_block
  azs  = data.aws_availability_zones.available.names
  tags = merge(local.shared_tags)

  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  create_igw             = var.create_igw

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  default_security_group_egress = []

  default_security_group_ingress = []
}
