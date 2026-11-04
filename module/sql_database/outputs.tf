output "sql_servers" {
  description = "Map of MSSQL servers"
  value       = azurerm_mssql_server.sql_server
  sensitive   = true
}

output "server_ids" {
  description = "Map of SQL server IDs"
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.id }
}

output "server_fqdns" {
  description = "Map of SQL server FQDNs"
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.fully_qualified_domain_name }
}

output "database_ids" {
  description = "Map of SQL database IDs"
  value       = { for k, v in azurerm_mssql_database.sql_db : k => v.id }
}
