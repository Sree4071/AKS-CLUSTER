terraform {
  backend "azurerm" {
    resource_group_name   = "myRG"
    storage_account_name  = "mytfstorage123"
    container_name        = "mytfstatecontainer"
    key                   = "terraform.tfstate"

  }
}