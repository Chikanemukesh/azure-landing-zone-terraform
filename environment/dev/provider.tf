terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.8.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "chikane"
    storage_account_name = "chikane125"
    container_name       = "chikane1"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}