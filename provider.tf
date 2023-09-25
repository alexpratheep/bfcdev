# Configure the AzureRM provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  subscription_id = "e8420c2c-6f70-4d5c-a3e8-42f8643108b5"
  tenant_id = "9729e73e-b2fc-4148-94e5-b6e7a0016dce"
  client_id = "8581ca28-6790-4e30-b862-6034d027aa12"
  client_secret = "cDz8Q~8BYxHddiE2zGMqTcjT7GS6FpD~E9N.IcJb"
  features {}  
}