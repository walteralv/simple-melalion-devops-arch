output "resource_group_name" {
  description = "Created Azure resource group name."
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Created storage account name."
  value       = azurerm_storage_account.this.name
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

output "databricks_catalog_name" {
  description = "Unity Catalog name created by Terraform."
  value       = databricks_catalog.this.name
}

output "databricks_schema_names" {
  description = "Unity Catalog schemas created by Terraform."
  value       = sort([for schema in databricks_schema.layers : schema.name])
}

output "databricks_sql_warehouse_id" {
  description = "Databricks SQL warehouse ID created by Terraform."
  value       = databricks_sql_endpoint.dev_clu.id
}

output "databricks_sql_warehouse_name" {
  description = "Databricks SQL warehouse name created by Terraform."
  value       = databricks_sql_endpoint.dev_clu.name
}
