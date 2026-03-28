locals {
  databricks_catalog_name      = "dtlk_catalog_${var.environment}"
  databricks_schema_names      = toset(["bronze", "silver", "gold"])
  databricks_sql_endpoint_name = "${upper(var.environment)}_CLU"

  tags = merge(
    {
      project     = var.project_name
      environment = var.environment
      managed_by  = "terraform"
    },
    var.tags
  )
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.tags
}

resource "azurerm_databricks_workspace" "this" {
  name                                  = var.databricks_workspace_name
  resource_group_name                   = azurerm_resource_group.this.name
  location                              = azurerm_resource_group.this.location
  sku                                   = var.databricks_sku
  managed_resource_group_name           = "${var.resource_group_name}-managed"
  infrastructure_encryption_enabled     = false
  public_network_access_enabled         = true
  network_security_group_rules_required = "AllRules"
  tags                                  = local.tags
}

resource "databricks_secret_scope" "platform" {
  name = var.databricks_secret_scope_name
}

resource "databricks_catalog" "this" {
  name    = local.databricks_catalog_name
  comment = "Data lakehouse catalog for the ${var.environment} environment."
}

resource "databricks_schema" "layers" {
  for_each     = local.databricks_schema_names
  catalog_name = databricks_catalog.this.name
  name         = each.value
  comment      = "${title(each.value)} layer schema for the ${var.environment} environment."
}

resource "databricks_sql_endpoint" "dev_clu" {
  name             = local.databricks_sql_endpoint_name
  cluster_size     = "2X-Small"
  min_num_clusters = 1
  max_num_clusters = 1
  auto_stop_mins   = 15
}
