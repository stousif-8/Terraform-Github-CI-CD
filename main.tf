provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "trigentazure-rg"
  location = "South India"
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"    # Required field for OS type
  sku_name            = "S1"     # Required SKU name
}

resource "azurerm_linux_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    # Add any relevant site configurations here
  }
}

