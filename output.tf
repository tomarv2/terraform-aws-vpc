output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "internet_gateway_route_id" {
  description = "ID of the internet gateway route"
  value       = module.vpc.database_internet_gateway_route_id
}

output "subnets" {
  description = "List of subnets IDs"
  value       = module.vpc.database_subnets
}

output "subnet_arns" {
  description = "List of subnets ARNs"
  value       = module.vpc.database_subnet_arns
}

output "default_security_group_id" {
  description = "The ID of the security group created by VPC"

  value = module.vpc.default_security_group_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
