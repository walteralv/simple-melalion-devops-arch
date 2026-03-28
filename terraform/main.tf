locals {
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

resource "azurerm_storage_account" "bronze" {
  name                     = var.storage_account_bronze_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.tags
}

resource "azurerm_storage_account" "silver" {
  name                     = var.storage_account_silver_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = local.tags
}

resource "azurerm_storage_account" "gold" {
  name                     = var.storage_account_gold_name
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
