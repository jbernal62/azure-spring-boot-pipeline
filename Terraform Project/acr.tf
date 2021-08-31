resource "azurerm_container_registry" "acr" {
  name                = "acrassessment"
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  location            = azurerm_resource_group.reactjs_assessment.location
  sku                 = "basic"
  admin_enabled       = true

}