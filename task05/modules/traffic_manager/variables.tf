variable "name" {
  description = "The name of the Traffic Manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "routing_method" {
  description = "The routing method of the Traffic Manager profile"
  type        = string
  default     = "Performance"
}

variable "endpoints" {
  description = "The endpoints for the Traffic Manager profile"
  type = list(object({
    name       = string
    target_id  = string
    weight     = optional(number)
    priority   = optional(number)
    location   = string
  }))
}

variable "tags" {
  description = "Tags for the Traffic Manager profile"
  type        = map(string)
  default     = {}
}
