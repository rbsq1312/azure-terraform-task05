resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows" # Explicitly Windows as required
  sku_name            = var.sku_name

  # worker_count is only applicable for Elastic Premium, Premium V2/V3, Standard, Basic, Isolated, Isolated V2 plans
  # It is ignored for Free/Shared/Consumption/P0v3. Set it anyway as Terraform might validate.
  worker_count = var.worker_count

  tags = var.tags
}
