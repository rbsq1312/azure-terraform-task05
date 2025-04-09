output "id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.rg.id
}

output "name" {
  description = "The Name of the resource group."
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "The Location of the resource group."
  value       = azurerm_resource_group.rg.location
}
