variable "resource_groups" {
  description = "Resource groups configuration"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "App Service Plans configuration"
  type = map(object({
    name               = string
    sku                = string
    worker_count       = number
    resource_group_key = string
  }))
}

variable "app_services" {
  description = "App Services configuration"
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
    allow_ip_rule_name   = string
    allow_tm_rule_name   = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager configuration"
  type = object({
    name               = string
    resource_group_key = string
    routing_method     = string
  })
}

variable "verification_agent_ip" {
  description = "Verification agent IP address"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}
