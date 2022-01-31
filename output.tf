output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_route_table_ids" {
  description = "List of private VPC route tables IDs"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of public VPC route tables IDs"
  value       = module.vpc.public_route_table_ids
}

output "default_security_group_id" {
  description = "The ID of the security group created by VPC"
  value = module.vpc.default_security_group_id
}

output "private_subnets" {
  description = "List of private subnet ids within VPC"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of public subnet ids within VPC"
  value       = module.vpc.public_subnets
}

output "internet_gateway_route_id" {
  description = "ID of the internet gateway route"
  value       = module.vpc.database_internet_gateway_route_id
}

output "subnet_arns" {
  description = "List of subnets ARNs"
  value       = module.vpc.database_subnet_arns
}
