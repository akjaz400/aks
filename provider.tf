provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "akjaz4tf"
    storage_account_name = "akjaz4tf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}