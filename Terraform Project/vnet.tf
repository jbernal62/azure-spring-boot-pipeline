resource "azurerm_network_security_group" "vnet-assessment" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
}

resource "azurerm_network_ddos_protection_plan" "vnet-assessment" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
}

resource "azurerm_virtual_network" "vnet-assessment" {
  name                = "vnet-assessment"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.vnet-assessment.id
    enable = true
  }

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"

  }

  tags = {
    environment = "Production"
  }
}