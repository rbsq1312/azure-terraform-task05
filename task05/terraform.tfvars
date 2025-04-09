resource_groups = {
  rg1 = {
    name     = "cmaz-49b8ddc2-mod5-rg-01"
    location = "westeurope"
  },
  rg2 = {
    name     = "cmaz-49b8ddc2-mod5-rg-02"
    location = "northeurope"
  },
  rg3 = {
    name     = "cmaz-49b8ddc2-mod5-rg-03"
    location = "eastus"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-49b8ddc2-mod5-asp-01"
    sku                = "P0v3"
    worker_count       = 2
    resource_group_key = "rg1"
  },
  asp2 = {
    name               = "cmaz-49b8ddc2-mod5-asp-02"
    sku                = "P1v3"
    worker_count       = 1
    resource_group_key = "rg2"
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-49b8ddc2-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
    allow_ip_rule_name   = "allow-ip"
    allow_tm_rule_name   = "allow-tm"
  },
  app2 = {
    name                 = "cmaz-49b8ddc2-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
    allow_ip_rule_name   = "allow-ip"
    allow_tm_rule_name   = "allow-tm"
  }
}

traffic_manager = {
  name               = "cmaz-49b8ddc2-mod5-traf"
  resource_group_key = "rg3"
  routing_method     = "Performance"
}

verification_agent_ip = "18.153.146.156"

tags = {
  Creator = "theodor-laurentiu_robescu@epam.com"
}
