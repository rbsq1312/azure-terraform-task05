variable "profile_name" {
  description = "The name of the Traffic Manager Profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Traffic Manager Profile."
  type        = string
}

variable "routing_method" {
  description = "Specifies the routing method for the Traffic Manager profile. (e.g., Performance, Weighted, Priority, Geographic, MultiValue, Subnet)"
  type        = string
}

variable "target_app_service_ids" {
  description = "A map where keys are desired endpoint names and values are the target Azure App Service resource IDs."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to assign to the Traffic Manager Profile."
  type        = map(string)
  default     = {}
}
