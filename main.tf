provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name = "Deployed-rg"
  location = "West India"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "Free"
    size = "F1"
  }
}
