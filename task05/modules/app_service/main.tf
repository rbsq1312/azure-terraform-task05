resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }

    dynamic "ip_restriction" {
      for_each = {
        (var.allow_ip_rule_name) = {
          priority    = 100
          ip_address  = "${var.allow_ip_address}/32"
          service_tag = null
        },
        (var.allow_tm_rule_name) = {
          priority    = 200
          ip_address  = null
          service_tag = "AzureTrafficManager"
        }
      }

      content {
        name        = ip_restriction.key
        priority    = ip_restriction.value.priority
        action      = "Allow"
        ip_address  = ip_restriction.value.ip_address
        service_tag = ip_restriction.value.service_tag
      }
    }

    ip_restriction_default_action = "Deny"

    dynamic "scm_ip_restriction" {
      for_each = {
        (var.allow_ip_rule_name) = {
          priority    = 100
          ip_address  = "${var.allow_ip_address}/32"
          service_tag = null
        },
        (var.allow_tm_rule_name) = {
          priority    = 200
          ip_address  = null
          service_tag = "AzureTrafficManager"
        }
      }

      content {
        name        = scm_ip_restriction.key
        priority    = scm_ip_restriction.value.priority
        action      = "Allow"
        ip_address  = scm_ip_restriction.value.ip_address
        service_tag = scm_ip_restriction.value.service_tag
      }
    }

    scm_ip_restriction_default_action = "Deny"
  }
}
