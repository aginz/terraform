# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  backend "remote" {
    organization = "MDLIVE"
    workspaces {
      name = "AAG-Workspace"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.rgName}"
  location = var.location
  tags     = var.tags
}
