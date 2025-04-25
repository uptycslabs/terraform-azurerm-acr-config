/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.39.1"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.32.0"
    }
  }
}

provider "azurerm" {
  features {}
}
