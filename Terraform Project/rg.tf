resource "azurerm_resource_group" "reactjs_assessment" {
  name     = "reactjs_assessment_webapp"
  location = var.location

  tags = {
    "Customer Name"   = "asessment"
    "Department Name" = "assessment_webapp"
    "Stream Name"     = "assessment_stream"
    "Type Name"       = "Infra"
  }


}

