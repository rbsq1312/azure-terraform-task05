variable "name" {
  description = "The name of the Windows Web App."
  type        = string
}

variable "location" {
  description = "The Azure region where the Web App will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Web App."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to host the Web App."
  type        = string
}

variable "ip_restrictions" {
  description = "A list of IP restriction rules for the main site."
  type = list(object({
    name                      = string
    ip_address                = optional(string)
    priority                  = number
    action                    = string
    service_tag               = optional(string)
    virtual_network_subnet_id = optional(string)
    headers = optional(list(object({
      x_azure_fdid      = list(string)
      x_fd_health_probe = list(string)
      x_forwarded_for   = list(string)
      x_forwarded_host  = list(string)
    })))
  }))
  default = []
}

variable "scm_ip_restrictions" {
  description = "A list of IP restriction rules for the SCM site."
  type = list(object({
    name                      = string
    ip_address                = optional(string)
    priority                  = number
    action                    = string
    service_tag               = optional(string)
    virtual_network_subnet_id = optional(string)
    headers = optional(list(object({
      x_azure_fdid      = list(string)
      x_fd_health_probe = list(string)
      x_forwarded_for   = list(string)
      x_forwarded_host  = list(string)
    })))
  }))
  default = []
}

variable "default_action" {
  description = "The default action for IP restrictions if no rule matches (Allow/Deny)."
  type        = string
  default     = "Deny"
  validation {
    condition     = contains(["Allow", "Deny"], var.default_action)
    error_message = "Default action must be either Allow or Deny."
  }
}

variable "tags" {
  description = "A map of tags to assign to the Web App."
  type        = map(string)
  default     = {}
}
