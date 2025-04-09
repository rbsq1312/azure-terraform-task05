resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on          = true # Good practice for non-free tiers
    http2_enabled      = true
    windows_fx_version = "DOTNETCORE|6.0" # Specify a default runtime, adjust if needed

    # --- IP Restrictions ---
    ip_restriction_default_action     = var.default_action
    scm_ip_restriction_default_action = "Allow" # Usually keep SCM open unless specified

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name                      = ip_restriction.value.name
        ip_address                = ip_restriction.value.ip_address
        priority                  = ip_restriction.value.priority
        action                    = ip_restriction.value.action
        service_tag               = ip_restriction.value.service_tag
        virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id

        dynamic "headers" {
          for_each = ip_restriction.value.headers[*]
          content {
            x_azure_fdid      = lookup(headers.value, "x_azure_fdid", null)
            x_fd_health_probe = lookup(headers.value, "x_fd_health_probe", null)
            x_forwarded_for   = lookup(headers.value, "x_forwarded_for", null)
            x_forwarded_host  = lookup(headers.value, "x_forwarded_host", null)
          }
        }
      }
    }

    dynamic "scm_ip_restriction" {
      for_each = var.scm_ip_restrictions
      content {
        name                      = scm_ip_restriction.value.name
        ip_address                = scm_ip_restriction.value.ip_address
        priority                  = scm_ip_restriction.value.priority
        action                    = scm_ip_restriction.value.action
        service_tag               = scm_ip_restriction.value.service_tag
        virtual_network_subnet_id = scm_ip_restriction.value.virtual_network_subnet_id

        dynamic "headers" {
          for_each = scm_ip_restriction.value.headers[*]
          content {
            x_azure_fdid      = lookup(headers.value, "x_azure_fdid", null)
            x_fd_health_probe = lookup(headers.value, "x_fd_health_probe", null)
            x_forwarded_for   = lookup(headers.value, "x_forwarded_for", null)
            x_forwarded_host  = lookup(headers.value, "x_forwarded_host", null)
          }
        }
      }
    }
    # --- End IP Restrictions ---
  }

  app_settings = {
    # Add any required application settings here if needed
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "7"
  }

  connection_string = [] # Define if needed

  tags = var.tags
}
