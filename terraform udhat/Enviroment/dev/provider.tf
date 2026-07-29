terraform {
  required_version = ">= 1.0.0"
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgamit"
    storage_account_name = "asmitstorage"
    container_name       = "asmitcon"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}