provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
tenant_id = var.tenant_id
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
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