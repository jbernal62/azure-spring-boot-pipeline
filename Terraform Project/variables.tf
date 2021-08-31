# variables.tf
variable "app_name" {
  default = "reactjsassessmentyb"
}

variable "location" {
  default = "East US 2"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate"
    storage_account_name = "tfassessment"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

#configure azurerm provider
provider "azurerm" {
  version = "1.38"
}

# provider "azurerm" {
#   version = "=1.28.0"
# }

provider "azuread" {
  version = "~>0.4"
}

provider "random" {
  version = "~>2.1"
}

locals {
  region_codes = {
    "East US 2" = "eus2"
  }

  app_service_name = "${var.app_name}-${lookup(local.region_codes, var.location)}-as"
}

# Create Client Secret
resource "random_uuid" "client_secret" {}

resource "random_string" "grafana_password" {
  length = 16
}


# variable "my_sql_master_password" {
#   description = "MySql master password"
# }

##### AKS VARIABLES #####

variable "client_id" {
  default = "b1e924aa-6dcf-456a-9ab4-76a3fe9f6bd9"
}

variable "client_secret" {
  default = "ET8o_23s3.EtqDYhRNu-h4J0dP-RbSWLx9"
}

variable "docker_image" {
  default = "image"
}

variable "docker_image_tag" {
  default = "latest"
}

variable "registry_password" {
  default = "xGtKTlui5Kxb8g7FhpPLk4bLpPtsoN0="
}