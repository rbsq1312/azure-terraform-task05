terraform {
  required_version = ">= 1.3" # Specify a recent version

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75" # Use a specific recent version of the Azure provider
    }
  }
}

# Configure the Azure Provider (Credentials will be handled by the verification environment)
provider "azurerm" {
  features {}
}
