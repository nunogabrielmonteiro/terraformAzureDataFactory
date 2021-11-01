terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  #version = "~> 2.34.0"
  features {}
}


##
# Resource Groups
##

data "azurerm_resource_group" "rg" {
  name = var.resource_group
}



##
# Keyvault
##

data "azurerm_key_vault" "kvt" {
  name                = var.kv_name
  resource_group_name = data.azurerm_resource_group.rg.name
}


##
# Log Analytics Workspace
##

data "azurerm_log_analytics_workspace" "lwk" {
  name                = var.lwk_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

##
# DataFactory
##

module "datafactory" {
  source = "git::https://github.alm.europe.cloudcenter.corp/sgt-cloudplatform/iac.az.blueprint.data-factory-sm.git?ref=v2.1.0"

  name                              = var.adf_name
  subscriptionid                    = var.subscription_id
  resource_group                    = data.azurerm_resource_group.rg.name
  kvtlwk_resource_group_name        = data.azurerm_log_analytics_workspace.lwk.resource_group_name
  location                          = var.location
  lwk_name                          = data.azurerm_log_analytics_workspace.lwk.name
  kvt_name                          = data.azurerm_key_vault.kvt.name
  analytics_diagnostic_monitor      = var.adf_analytics_diagnostic_monitor
  adf_vnet_enabled                  = false
  adf_public_network_access_enabled = var.adf_enable_public_access
  key_name                          = var.adf_key_name
  enable_cmk                        = false
  template_adanalytics_name         = "ADAnalytics"
  cmk_identity                      = ""
  cia                               = var.cia
  description                       = var.adf_description
  tracking_code                     = var.tracking_code
}