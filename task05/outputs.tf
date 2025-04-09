output "traffic_manager_fqdn" {
  description = "The FQDN of the Azure Traffic Manager profile."
  value       = module.traffic_manager.fqdn
}

# Optional: Output other useful info for verification if needed
output "app_service_hostnames" {
  description = "Default hostnames of the deployed App Services."
  value = {
    for k, v in module.app_services : k => v.default_hostname
  }
}

output "resource_group_locations" {
  description = "Locations of the created resource groups."
  value = {
    for k, v in module.resource_groups : k => v.location
  }
}
