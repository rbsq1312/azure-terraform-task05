# Choose 3 unique Azure locations
resource_groups = {
  rg1 = {
    name     = "cmaz-49b8ddc2-mod5-rg-01"
    location = "West Europe"
  }
  rg2 = {
    name     = "cmaz-49b8ddc2-mod5-rg-02"
    location = "East US"
  }
  rg3 = {
    name     = "cmaz-49b8ddc2-mod5-rg-03"
    location = "North Europe" # Changed to North Europe for uniqueness
  }
}

web_apps = {
  app1 = {
    app_name            = "cmaz-49b8ddc2-mod5-app-01"
    plan_name           = "cmaz-49b8ddc2-mod5-asp-01"
    rg_key              = "rg1"
    plan_sku            = "P0v3" # Corrected SKU for ASP1
    plan_worker_count   = 2
    verification_ip     = "18.153.146.156"
  }
  app2 = {
    app_name            = "cmaz-49b8ddc2-mod5-app-02"
    plan_name           = "cmaz-49b8ddc2-mod5-asp-02"
    rg_key              = "rg2"
    plan_sku            = "P1v3"
    plan_worker_count   = 1
    verification_ip     = "18.153.146.156"
  }
}

traffic_manager_profile = {
  profile_name   = "cmaz-49b8ddc2-mod5-traf"
  rg_key         = "rg3"
  routing_method = "Performance"
}

creator_tag = {
  Creator = "theodor-laurentiu_robescu@epam.com"
}
