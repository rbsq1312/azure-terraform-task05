# Create Resource Groups
module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = merge(var.common_tags, var.creator_tag)
}

# Create App Service Plans
module "app_service_plans" {
  source   = "./modules/app_service_plan"
  for_each = var.web_apps

  name                = each.value.plan_name
  location            = module.resource_groups[each.value.rg_key].location
  resource_group_name = module.resource_groups[each.value.rg_key].name
  sku_name            = each.value.plan_sku
  worker_count        = each.value.plan_worker_count
  tags                = merge(var.common_tags, var.creator_tag)

  depends_on = [module.resource_groups]
}

# Create Windows App Services
module "app_services" {
  source   = "./modules/app_service"
  for_each = var.web_apps

  name                  = each.value.app_name
  location              = module.resource_groups[each.value.rg_key].location
  resource_group_name   = module.resource_groups[each.value.rg_key].name
  app_service_plan_id = module.app_service_plans[each.key].id

  # Define IP restriction rules as required by the task
  ip_restrictions = [
    {
      name                      = "allow-ip"
      ip_address                = each.value.verification_ip
      priority                  = 100
      action                    = "Allow"
      service_tag               = null # mutually exclusive with ip_address
      virtual_network_subnet_id = null # mutually exclusive
      headers                   = null
    },
    {
      name                      = "allow-tm"
      ip_address                = null # mutually exclusive with service_tag
      priority                  = 110
      action                    = "Allow"
      service_tag               = "AzureTrafficManager"
      virtual_network_subnet_id = null # mutually exclusive
      headers                   = null
    }
  ]
  scm_ip_restrictions = [] # Keep SCM open unless specified otherwise
  default_action      = "Deny"
  tags                = merge(var.common_tags, var.creator_tag)

  depends_on = [module.app_service_plans]
}

# Create Traffic Manager Profile and Endpoints
module "traffic_manager" {
  source = "./modules/traffic_manager"

  profile_name        = var.traffic_manager_profile.profile_name
  resource_group_name = module.resource_groups[var.traffic_manager_profile.rg_key].name
  routing_method      = var.traffic_manager_profile.routing_method
  tags                = merge(var.common_tags, var.creator_tag)

  # Create a map of endpoint names to target app service IDs
  target_app_service_ids = {
    for k, v in module.app_services : "${v.name}-endpoint" => v.id
  }

  depends_on = [module.app_services]
}
