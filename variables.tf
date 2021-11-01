##
# General
##

variable "resource_group" {
  type        = string
  description = "The Resource Group name"
  default = "nunomoresourcegroup"
}

variable "subscription_id" {
  type        = string
  description = "The Subscription ID"
  default = "9f3d6b6f-08ab-446f-add6-c47e971cf133"
}

variable "channel" {
  type        = string
  description = "The Channel tag value"
  default     = "Intranet"
}

variable "cost_center" {
  type        = string
  description = "The Cost Center tag value"
  default     = "CC-50014181"
}

variable "cia" {
  type        = string
  description = "The CIA (Confidentiality, Integrity and Availability) tag value"
  default     = "AHC"
}

variable "tracking_code" {
  type        = string
  description = "The Tracking Code tag value"
  default     = "SD2003568B"
}

variable "location" {
  type        = string
  description = "The Location"
  default     = "westeurope"
}

variable "product" {
  type        = string
  description = "The product Tag"
  default = "Azure resource for Workload: CLDTLK"
}


##
# Keyvaults
##

variable "kv_name" {
  type        = string
  description = "The KeyVault name"
  default = "nunomokv"
}



##
# Log Analytics Workspaces
##

variable "lwk_name" {
  type        = string
  description = "The Log Analytics Workspace name"
  default = "nunomolaw"
}


##
# DataFactory
##

variable "adf_name" {
  type        = string
  description = "The DataFactory name"
  default = "nunomoadf"
}

variable "adf_analytics_diagnostic_monitor" {
  type = string
  description = "(Mandatory) Specifies the monitor diagnostic name."
  default = "afdadm_name"
}

variable "adf_description" {
  type        = string
  description = "Provide additional context information describing the resource and its purpose."
  default = "ADF Description"
}

variable "adf_key_name" {
  type        = string
  description = ""
  default = "totd1weuadfcldtlkcrit001-key03"
}

variable "adf_enable_public_access" {
  type        = bool
  description = ""
  default = false
}

variable "adf_cmk_identity" {
  type        = string
  description = ""
  default = ""
}