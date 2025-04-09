output "id" {
  description = "The ID of the Windows Web App."
  value       = azurerm_windows_web_app.app.id
}

output "name" {
  description = "The Name of the Windows Web App."
  value       = azurerm_windows_web_app.app.name
}

output "default_hostname" {
  description = "The default hostname of the Windows Web App."
  value       = azurerm_windows_web_app.app.default_hostname
}
