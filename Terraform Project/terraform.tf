resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "assessment-cluster"
  location            = azurerm_resource_group.reactjs_assessment.location
  resource_group_name = azurerm_resource_group.reactjs_assessment.name
  dns_prefix          = "assessment-cluster"

  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "standard_d2_v2"
  }

  lifecycle {
    prevent_destroy = true
  }

  #   identity {
  #     type = "SystemAssigned"
  #   }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
}