provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "azure-terraform-rg"
  location = "Canada Central"
}

resource "azurerm_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"    # Required field for OS type
  sku_name            = "P1v3"     # Required SKU name
}

resource "azurerm_app_service" "example" {
  name                = "example-appsservice" # Unique name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id              # Correct reference to service plan

  site_config {
    linux_fx_version = "NODE|18"
    # Add any relevant site configurations here
  }
}

