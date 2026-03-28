output "resource_group_name" {
  description = "Created Azure resource group name."
  value       = azurerm_resource_group.this.name
}

output "storage_account_bronze_name" {
  description = "Created bronze storage account name."
  value       = azurerm_storage_account.bronze.name
}

output "storage_account_silver_name" {
  description = "Created silver storage account name."
  value       = azurerm_storage_account.silver.name
}

output "storage_account_gold_name" {
  description = "Created gold storage account name."
  value       = azurerm_storage_account.gold.name
}

output "databricks_workspace_name" {
  description = "Created Databricks workspace name."
  value       = azurerm_databricks_workspace.this.name
}

output "databricks_workspace_url" {
  description = "Databricks workspace URL."
  value       = azurerm_databricks_workspace.this.workspace_url
}

output "databricks_secret_scope_name" {
  description = "Initial Databricks secret scope created by Terraform."
  value       = databricks_secret_scope.platform.name
}
