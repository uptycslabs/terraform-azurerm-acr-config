/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.43.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
}
