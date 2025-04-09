output "id" {
  description = "The ID of the App Service"
  value       = azurerm_windows_web_app.app.id
}

output "default_hostname" {
  description = "The default hostname of the App Service"
  value       = azurerm_windows_web_app.app.default_hostname
}

output "name" {
  description = "The name of the App Service"
  value       = azurerm_windows_web_app.app.name
}
