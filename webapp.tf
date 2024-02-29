#create a resource group
resource "Azurerm_resource_group" "dev-rg" {
  
name = var.resource_group_name
location = var.location
}


#create appp service plan


resource "azurerm_app_service_plan" "service-plan" {
  name                = "simple-service-plan"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags={
    environment ="dev"
  }
}


#Create Java App service

resource "azurerm_app_service" "app-service" {
  name = "my-sweesome-app-svc-2022"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id
  site_config {
    linux_fx_version = "TOMCAT|8.5-jave11"
  }
  tags = {
    environment = "dev"
  }
}