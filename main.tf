provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "trigent-devops-rg"
  location = "West India"
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "P1v3"
}
