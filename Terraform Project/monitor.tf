resource "azurerm_monitor_autoscale_setting" "webapp" {
  name                = "myAutoscaleSetting1"
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  location            = azurerm_resource_group.reactjs_assessment.location
  target_resource_id  = azurerm_app_service_plan.reactjs_asessment.id
  profile {
    name = "default"
    capacity {
      default = 1
      minimum = 1
      maximum = 10
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_app_service_plan.reactjs_asessment.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 90
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_app_service_plan.reactjs_asessment.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 10
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}

######## Docker WebApp ####### 


# resource "azurerm_monitor_autoscale_setting" "webapp_docker" {
#   name                = "myAutoscaleSetting"
#   resource_group_name = azurerm_resource_group.reactjs_assessment.name
#   location            = azurerm_resource_group.reactjs_assessment.location
#   target_resource_id  = azurerm_app_service_plan.docker_serviceplan.id
#   profile {
#     name = "default"
#     capacity {
#       default = 1
#       minimum = 1
#       maximum = 10
#     }
#     rule {
#       metric_trigger {
#         metric_name        = "CpuPercentage"
#         metric_resource_id = azurerm_app_service_plan.docker_serviceplan.id
#         time_grain         = "PT1M"
#         statistic          = "Average"
#         time_window        = "PT5M"
#         time_aggregation   = "Average"
#         operator           = "GreaterThan"
#         threshold          = 90
#       }
#       scale_action {
#         direction = "Increase"
#         type      = "ChangeCount"
#         value     = "1"
#         cooldown  = "PT1M"
#       }
#     }
#     rule {
#       metric_trigger {
#         metric_name        = "CpuPercentage"
#         metric_resource_id = azurerm_app_service_plan.docker_serviceplan.id
#         time_grain         = "PT1M"
#         statistic          = "Average"
#         time_window        = "PT5M"
#         time_aggregation   = "Average"
#         operator           = "LessThan"
#         threshold          = 10
#       }
#       scale_action {
#         direction = "Decrease"
#         type      = "ChangeCount"
#         value     = "1"
#         cooldown  = "PT1M"
#       }
#     }
#   }
# }