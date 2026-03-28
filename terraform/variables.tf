variable "subscription_id" {
  description = "Azure subscription ID where resources will be created."
  type        = string
}

variable "project_name" {
  description = "Project name used in tags and naming."
  type        = string
}

variable "environment" {
  description = "Environment name, for example dev, qa, or prod."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Azure resource group name."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name."
  type        = string
}

variable "databricks_workspace_name" {
  description = "Azure Databricks workspace name."
  type        = string
}

variable "databricks_sku" {
  description = "Azure Databricks SKU. Common values: standard, premium, trial."
  type        = string
  default     = "premium"
}

variable "databricks_secret_scope_name" {
  description = "Initial Databricks secret scope name."
  type        = string
  default     = "platform-secrets"
}

variable "tags" {
  description = "Additional tags applied to Azure resources."
  type        = map(string)
  default     = {}
}
