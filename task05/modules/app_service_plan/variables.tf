variable "name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service Plan will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service Plan."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., P1v3, S1, B1)."
  type        = string
}

variable "worker_count" {
  description = "The number of worker instances for the App Service Plan."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to the App Service Plan."
  type        = map(string)
  default     = {}
}
