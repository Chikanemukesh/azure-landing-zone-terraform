# Azure MSSQL Server and Database
# Purpose: Managed relational database (cost-effective Basic tier 5 DTU, 2GB max size).

resource "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_servers

  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  version                       = "12.0"
  administrator_login           = coalesce(each.value.admin_username, "sqladminuser")
  administrator_login_password  = coalesce(each.value.admin_password, "AzureSqlLandingZone@2026")
  minimum_tls_version           = "1.2"
  public_network_access_enabled = coalesce(each.value.public_network_access_enabled, false)

  tags = each.value.tags
}

resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_servers

  name        = each.value.database_name
  server_id   = azurerm_mssql_server.sql_server[each.key].id
  sku_name    = coalesce(each.value.database_sku, "Basic")
  max_size_gb = coalesce(each.value.max_size_gb, 2)

  tags = each.value.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  for_each = { for k, v in var.sql_servers : k => v if coalesce(v.allow_azure_services, false) }

  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.sql_server[each.key].id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
