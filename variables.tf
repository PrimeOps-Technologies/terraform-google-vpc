#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "primeOps-technologies"
  description = "ManagedBy,primeOps-technologies'."
}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources."
  default     = true
}

####################(vpc)################
variable "description" {
  type        = string
  default     = ""
  description = "(Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''."
}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "- (Optional) The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router."
}

variable "enable_ula_internal_ipv6" {
  type        = bool
  default     = null
  description = "(Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20."
}

variable "internal_ipv6_range" {
  type        = bool
  default     = null
  description = "(Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field."
}

variable "network_firewall_policy_enforcement_order" {
  type        = string
  default     = "AFTER_CLASSIC_FIREWALL"
  description = "(Optional) Set the order that Firewall Rules and Firewall Policies are evaluated. Default value is AFTER_CLASSIC_FIREWALL. Possible values are: BEFORE_CLASSIC_FIREWALL, AFTER_CLASSIC_FIREWALL"
}

variable "delete_default_routes_on_create" {
  type        = bool
  default     = false
  description = "(Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted."
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
  description = "(Optional) When set to true, the network is created in [auto_subnet_mode] and it will create a subnet for each region automatically across the 10.128.0.0/9 address range."
}

variable "mtu" {
  type        = number
  default     = 1460
  description = "(Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'."
}

variable "network_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable vpc."
}

#---------------------------------------------------------------------------------------------------------
# shared_vpc_variable #
#----------------------------------------------------------------------------------------------------------

variable "host_project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = null
}

variable "shared_vpc_host_enabled" {
  type        = bool
  default     = false
  description = "Set to false to disable the creation of Google Compute Engine shared VPC host project."
}

variable "service_project_id" {
  description = "The ID of the project that will serve as a Shared VPC service project"
  type        = string
  default     = null
}

variable "deletion_policy" {
  description = "Deletion policy for the shared VPC service project. Use 'ABANDON' to abandon instead of delete."
  type        = string
  default     = null
}