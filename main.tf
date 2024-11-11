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

resource "random_id" "suffix" {
  byte_length = 4
}

resource "azurerm_app_service" "example" {
  name                = "example-appservice-${random_id.suffix.hex}" # Unique name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_service_plan.example.id              # Correct reference to service plan

  site_config {
    # Add any relevant site configurations here
  }
}

