variable "name" {
  description = "The name of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the App Service"
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan"
  type        = string
}

variable "tags" {
  description = "Tags for the App Service"
  type        = map(string)
  default     = {}
}

variable "allow_ip_address" {
  description = "IP address to allow access"
  type        = string
}

variable "allow_ip_rule_name" {
  description = "Name for the IP allow rule"
  type        = string
  default     = "allow-ip"
}

variable "allow_tm_rule_name" {
  description = "Name for the Traffic Manager allow rule"
  type        = string
  default     = "allow-tm"
}
