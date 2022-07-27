data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  cidr = var.cidr_block
  azs  = data.aws_availability_zones.available.names

  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  create_igw             = var.create_igw

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  default_security_group_egress = []
  default_security_group_ingress = []

  enable_flow_log                       = var.enable_flow_log
  create_flow_log_cloudwatch_log_group  = var.create_flow_log_cloudwatch_log_group
  flow_log_file_format                  = var.flow_log_file_format
  flow_log_cloudwatch_iam_role_arn      = var.flow_log_cloudwatch_iam_role_arn
  vpc_flow_log_tags                     = var.vpc_flow_log_tags

  tags                = merge(var.custom_tags, local.shared_tags)
  public_subnet_tags  = merge(var.public_subnet_tags, local.shared_tags, var.custom_tags)
  private_subnet_tags = merge(var.private_subnet_tags, local.shared_tags, var.custom_tags)
}
