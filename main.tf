module "labels" {
  source      = "git::https://github.com/PrimeOps-Technologies/terraform-multicloud-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

data "google_client_config" "current" {
}

########################(vpc)#########################
resource "google_compute_network" "vpc_network" {
  count                                     = var.network_enabled && var.enabled ? 1 : 0
  project                                   = data.google_client_config.current.project
  name                                      = module.labels.id
  description                               = var.description
  routing_mode                              = var.routing_mode
  mtu                                       = var.mtu
  auto_create_subnetworks                   = var.auto_create_subnetworks
  enable_ula_internal_ipv6                  = var.enable_ula_internal_ipv6
  internal_ipv6_range                       = var.internal_ipv6_range
  delete_default_routes_on_create           = var.delete_default_routes_on_create
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
}


#-------------------------------------------------------------------------------
# shared_vpc_Configuration  #
#-------------------------------------------------------------------------------

resource "google_compute_shared_vpc_host_project" "host" {
  count   = var.shared_vpc_host_enabled && var.enabled ? 1 : 0
  project = var.host_project_id
}

resource "google_compute_shared_vpc_service_project" "service1" {
  count           = var.shared_vpc_host_enabled && var.enabled ? 1 : 0
  host_project    = google_compute_shared_vpc_host_project.host[count.index].project
  service_project = var.service_project_id
  deletion_policy = var.deletion_policy
}
