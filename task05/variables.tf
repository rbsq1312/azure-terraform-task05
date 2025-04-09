variable "resource_groups" {
  description = "A map of resource groups to create."
  type = map(object({
    name     = string
    location = string
  }))
  default = {}
}

variable "web_apps" {
  description = "A map of web apps and their associated service plans to create."
  type = map(object({
    app_name          = string
    plan_name         = string
    rg_key            = string # Key referencing the resource_groups map
    plan_sku          = string
    plan_worker_count = number
    verification_ip   = string
  }))
  default = {}
}

variable "traffic_manager_profile" {
  description = "Configuration for the Traffic Manager profile."
  type = object({
    profile_name   = string
    rg_key         = string # Key referencing the resource_groups map
    routing_method = string
  })
  default = null # Make it non-optional
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}

variable "creator_tag" {
  description = "Tag identifying the creator."
  type        = map(string)
  default     = {}
}
