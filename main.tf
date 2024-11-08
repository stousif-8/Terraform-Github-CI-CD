provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "testing-rg"
  location = "Canada Central"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "PremiumV3"
    size = "P0v3"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-appservice"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    # Add relevant site configurations here, e.g., stack settings
  }
}
