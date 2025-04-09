variable "name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the App Service Plan"
  type        = string
}

variable "sku" {
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "The number of workers for the App Service Plan"
  type        = number
}

variable "tags" {
  description = "Tags for the App Service Plan"
  type        = map(string)
  default     = {}
}
