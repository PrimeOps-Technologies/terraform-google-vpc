output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The outputs of the created VPC."
}

output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The outputs of the created VPC Name."
}

output "gateway_ipv4" {
  value       = module.vpc.gateway_ipv4
  description = "The IPv4 address of the gateway"
}

output "self_link" {
  value       = module.vpc.self_link
  description = "The URI of the created resource"
}