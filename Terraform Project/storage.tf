resource "azurerm_storage_account" "webapp-assessment" {
  name                     = "reactjsasessment"
  resource_group_name      = azurerm_resource_group.reactjs_assessment.name
  location                 = azurerm_resource_group.reactjs_assessment.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "webapp-assessment" {
  name                 = var.app_name
  resource_group_name  = azurerm_resource_group.reactjs_assessment.name
  storage_account_name = azurerm_storage_account.webapp-assessment.name
  quota                = 50
}


# az storage container create --name terraformstate --account-name reactjsasessment
