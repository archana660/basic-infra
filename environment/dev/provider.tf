terraform {
  backend "azurerm" {
    resource_group_name  = "rg-garv"
    storage_account_name = "garvhealthcarestg100"
    container_name       = "myhealth"
    key                  = "dev.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }
  }
}

provider "azurerm" {
  features {}
}