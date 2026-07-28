terraform {
  required_version = ">= 1.0.0"
  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgamit"
    storage_account_name = "asmitstorage" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "asmitcon"     # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}