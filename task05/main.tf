# Resource Groups
module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# App Service Plans
module "app_service_plans" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  sku                 = each.value.sku
  worker_count        = each.value.worker_count
  tags                = var.tags
}

# App Services
module "app_services" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  service_plan_id     = module.app_service_plans[each.value.app_service_plan_key].id
  allow_ip_address    = var.verification_agent_ip
  allow_ip_rule_name  = each.value.allow_ip_rule_name
  allow_tm_rule_name  = each.value.allow_tm_rule_name
  tags                = var.tags
}

# Traffic Manager
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager.name
  resource_group_name = module.resource_groups[var.traffic_manager.resource_group_key].name
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  endpoints = [
    {
      name      = module.app_services["app1"].name
      target_id = module.app_services["app1"].id
      location  = module.resource_groups["rg1"].location
    },
    {
      name      = module.app_services["app2"].name
      target_id = module.app_services["app2"].id
      location  = module.resource_groups["rg2"].location
    }
  ]
}
