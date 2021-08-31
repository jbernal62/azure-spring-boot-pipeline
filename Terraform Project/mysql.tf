resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azurerm_mysql_server" "main" {
  name                = "${var.app_name}-mysql-server"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name

  sku {
    name     = "B_Gen5_2"
    capacity = 2
    tier     = "Basic"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login = "mysqladminun"
  # administrator_login_password = random_password.password.result
  administrator_login_password = "Mysql@2021"
  version                      = "5.7"
  ssl_enforcement              = "Disabled"
}


resource "azurerm_mysql_database" "main" {
  name                = "${var.app_name}_mysql_db"
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  server_name         = azurerm_mysql_server.main.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


resource "azurerm_mysql_firewall_rule" "main" {
  name                = "${var.app_name}-mysql-firewall"
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  server_name         = azurerm_mysql_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}