# outputs.tf

output "traffic_manager_fqdn" {
  description = "The FQDN of the Azure Traffic Manager profile."
  value       = module.traffic_manager.fqdn
}

# Removed app_service_hostnames output
# Removed resource_group_locations output
