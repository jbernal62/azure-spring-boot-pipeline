resource "azurerm_app_service_plan" "reactjs_asessment" {
  name                = "reactjs_asessment"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}


resource "azurerm_app_service" "maven_asessment" {
  name                = "wpmavenwebapp"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  app_service_plan_id = azurerm_app_service_plan.reactjs_asessment.id

  site_config {
    linux_fx_version = "JAVA|8-jre8"

  }
}

######## WebApp using Docker ##############

resource "azurerm_app_service_plan" "docker_serviceplan" {
  name                = "dockerplan"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_app_service" "docker_asessment" {
  name                = "dockerspring"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  app_service_plan_id = azurerm_app_service_plan.docker_serviceplan.id

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|${var.docker_image}:${var.docker_image_tag}"
    always_on        = true
  }

  app_settings = {

    "DOCKER_REGISTRY_SERVER_URL"      = "https://acrassessment.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME" = "acrassessment"
    "DOCKER_REGISTRY_SERVER_PASSWORD" = "xGtKTlui5Kxb8g7FhpPLk4bLpPtsoN0="



    "SPRING_PROFILES_ACTIVE"     = "production"
    "SPRING_DATASOURCE_URL"      = "jdbc:mysql://${azurerm_mysql_server.main.fqdn}:3306/${azurerm_mysql_database.main.name}?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC"
    "SPRING_DATASOURCE_USERNAME" = "mysqladminun"
    "SPRING_DATASOURCE_PASSWORD" = "Mysql@2021"
  }
}

