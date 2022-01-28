output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "internet_gateway_route_id" {
  description = "ID of the internet gateway route"
  value       = module.vpc.database_internet_gateway_route_id
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids
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
  value       = module.vpc.default_security_group_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "security_group" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.default_security_group_id
}
