output "vpc_id" {
  value       = join("", google_compute_network.vpc_network[*].id)
  description = "The outputs of the created VPC."
}

output "gateway_ipv4" {
  value       = join("", google_compute_network.vpc_network[*].gateway_ipv4)
  description = "The IPv4 address of the gateway"
}

output "self_link" {
  value       = join("", google_compute_network.vpc_network[*].self_link)
  description = "The URI of the created resource"
}

output "vpc_name" {
  value       = join("", google_compute_network.vpc_network[*].name)
  description = "The outputs of the created VPC Name."
}