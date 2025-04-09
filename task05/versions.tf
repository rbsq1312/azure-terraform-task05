terraform {
  # Update this line
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Update this line
      version = ">= 3.110.0, < 4.0.0"
    }
  }
}

# Configure the Azure Provider (Credentials will be handled by the verification environment)
provider "azurerm" {
  features {}
}
