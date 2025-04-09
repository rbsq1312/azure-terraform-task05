output "id" {
  description = "The ID of the Traffic Manager Profile."
  value       = azurerm_traffic_manager_profile.tm_profile.id
}

output "fqdn" {
  description = "The FQDN of the Traffic Manager Profile."
  value       = azurerm_traffic_manager_profile.tm_profile.fqdn
}
