output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_route_id" {
  value = module.vpc.internet_gateway_route_id
}

output "subnets" {
  value = module.vpc.subnets
}

output "subnet_arns" {
  value = module.vpc.subnet_arns
}

output "default_security_group_id" {
  value = module.vpc.default_security_group_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}