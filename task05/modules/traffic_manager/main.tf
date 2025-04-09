resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                   = var.profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    # Use profile name for uniqueness, Azure appends the rest
    relative_name = lower(var.profile_name)
    ttl           = 60
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoints" {
  for_each = var.target_app_service_ids

  name                = each.key # Use the map key as the endpoint name
  profile_id          = azurerm_traffic_manager_profile.tm_profile.id
  target_resource_id  = each.value # Use the map value (App Service ID) as the target
  weight              = 100 # Required even for Performance routing, default to equal weight/priority
}
